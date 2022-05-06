import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stayfit/controller/profile_controller.dart';
import 'package:stayfit/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:stayfit/views/constants/constants.dart';

import '../views/wigdets/toast/toast.dart';

// class UserSimplify {
//   final String name;
//   final List profile;
//   final
// }

class UserApi {
  //
  static getUser({required ProfileController profileController}) async {
    String url = "http://app.geekstudios.tech/user/v1/profile/get";
    print("url $url");
    final uri = Uri.parse(url);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");

    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).timeout(const Duration(seconds: 3));

      debugPrint("------------status code------------");
      debugPrint("${response.statusCode}");
      debugPrint("st ${jsonDecode(response.body)["status_code"]}");
      debugPrint("message ${jsonDecode(response.body)["message"]}");
      debugPrint("response ${jsonDecode(response.body)}");

      debugPrint("-----------------------------------");
      if (jsonDecode(response.body)["response_code"] == 200) {
        showToast(
            color: primaryPurple,
            context: Get.overlayContext!,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.check);
        profileController.userProfile =
            UserModel.fromMap(jsonDecode(response.body)["response"]["user"]);
        profileController.update();
      } else {
        showToast(
            context: Get.overlayContext!,
            color: Colors.orange,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.warning);
        // return;
      }
    } catch (e) {
      debugPrint("Error occured while registering $e");
      // return 501;
    }
  }

  static Future<List<UserModel>> getNearbyUsers(String km) async {
    String url =
        "http://app.geekstudios.tech/user/v1/profile/get/nearby-users/$km";
    final uri = Uri.parse(url);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");
    print(accessToken);
    List<UserModel> users = [];
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).timeout(const Duration(seconds: 3));
      print("------------------------");
      print(response.body);
      if (jsonDecode(response.body)["response_code"] == 200) {
        showToast(
            color: primaryPurple,
            context: Get.overlayContext!,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.check);

        final List a = jsonDecode(response.body)["response"]["users"];
        users = a.map((e) => UserModel.fromMap(e)).toList();
      } else {
        showToast(
            context: Get.overlayContext!,
            color: Colors.orange,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.warning);
        // return;
      }
    } catch (e) {
      debugPrint("Error occured while registering $e");
    }
    return users;
  }
}
