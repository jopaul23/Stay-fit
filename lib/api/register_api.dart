import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/toast/toast.dart';

const String baseUrl = "http://app.geekstudios.tech";

class RegisterApi {
  static Future<int> emailCheck(
      {required String mobile, required String countryCode}) async {
    String url = "$baseUrl/auth/v1/login";
    print("url $url");
    final uri = Uri.parse(url);
    print("phone $mobile");
    print("country $countryCode");
    Map<String, dynamic> body = {"phone": mobile, "country_code": countryCode};
    try {
      http.Response response = await http
          .post(
            uri,
            headers: {"Content-Type": "application/json"},
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: 3));

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
        return 200;
      } else {
        showToast(
            context: Get.overlayContext!,
            color: Colors.orange,
            title: jsonDecode(response.body)["message"],
            description: "",
            icon: Icons.warning);
        return 400;
      }
    } catch (e) {
      debugPrint("Error occured while registering $e");
      return 501;
    }
  }
}
