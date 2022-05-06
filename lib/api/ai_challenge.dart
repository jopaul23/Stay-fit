import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/constants/constants.dart';
import '../views/wigdets/toast/toast.dart';

class AiChallengeApi {
  static Future<Map<String, dynamic>> sendData(String id, int count) async {
    String url = "http://app.geekstudios.tech/user/v1/challenge/update";
    Uri uri = Uri.parse(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");
    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode({"id": id}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).timeout(const Duration(seconds: 3));

      return jsonDecode(response.body);
    } catch (e) {
      debugPrint("Error occured while registering $e");
      showToast(
          context: Get.overlayContext!,
          color: Colors.orange,
          title: e.toString(),
          description: "",
          icon: Icons.warning);
    }
    return {};
  }

  static Future<String?> sendChallengeequest(String userid) async {
    String url = "http://app.geekstudios.tech/user/v1/challenge/sent";
    Uri uri = Uri.parse(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");
    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode({"id": userid}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).timeout(const Duration(seconds: 3));

      if (jsonDecode(response.body)["response_code"] == 200) {
        showToast(
            color: primaryPurple,
            context: Get.overlayContext!,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.check);
        Map<String, dynamic> decoded = jsonDecode(response.body);
        return decoded["response"]["request_id"];
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
      showToast(
          context: Get.overlayContext!,
          color: Colors.orange,
          title: e.toString(),
          description: "",
          icon: Icons.warning);
    }
  }

  static Future<String?> acceptChallengeequest(String chalengeId) async {
    String url = "http://app.geekstudios.tech/user/v1/challenge/accept";
    Uri uri = Uri.parse(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");
    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode({"id": chalengeId}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).timeout(const Duration(seconds: 3));

      if (jsonDecode(response.body)["response_code"] == 200) {
        showToast(
            color: primaryPurple,
            context: Get.overlayContext!,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.check);
        Map<String, dynamic> decoded = jsonDecode(response.body);
        return decoded["response"]["request_id"];
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
      showToast(
          context: Get.overlayContext!,
          color: Colors.orange,
          title: e.toString(),
          description: "",
          icon: Icons.warning);
    }
  }
}
