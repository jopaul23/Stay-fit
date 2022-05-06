import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stayfit/api/user_api.dart';
import 'package:stayfit/models/notification_model.dart';
import 'package:stayfit/models/user_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/toast/toast.dart';

class NotificationApi {
  static Future<List<NotificationModel>> getNotifications() async {
    String url = "http://app.geekstudios.tech/contact/v1/get";
    final uri = Uri.parse(url);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");
    List<NotificationModel> notifications = [];
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
        List res = jsonDecode(response.body)["response"]["notifications"];

        for (Map<String, dynamic> noti in res) {
          if (noti["type"] == "request") {
            notifications.add(NotificaionRequestModel.fromMap(noti));
          } else if (noti["type"] == "challenge") {
            UserModel? u = await UserApi.getDetailsUser(noti["oponent"]);

            notifications.add(NotificaionChallengeModel.fromMap(noti, u!));
          }
        }
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
    return notifications;
  }
}
