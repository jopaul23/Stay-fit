import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/home.dart';
import 'package:stayfit/views/screens/registration/extra-details/extra_details.dart';
import 'package:stayfit/views/screens/registration/otp/otp_verification.dart';
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
        Get.to(OtpPage(
          mobile: mobile,
          countryCode: countryCode,
          passedOtp: jsonDecode(response.body)["response"]["otp"],
        ));
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

  static Future<int> verificationApi(
      {required String mobile,
      required String countryCode,
      required String otp}) async {
    String url = "$baseUrl/auth/v1/validate/otp/";
    print("url $url");
    final uri = Uri.parse(url);
    print("phone $mobile");
    print("country $countryCode");
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("---------------------fcm-------------------");
    print("fcm $fcmToken ");
    print("---------------------fcm-------------------");
    Map<String, dynamic> body = {
      "phone": mobile,
      "country_code": countryCode,
      "otp": otp,
      "device": {
        "fcm": fcmToken,
      }
    };
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
        if (jsonDecode(response.body)["response_code"] == 200) {
          showToast(
              color: primaryPurple,
              context: Get.overlayContext!,
              title: jsonDecode(response.body)["message"],
              description: "",
              icon: Icons.check);

          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(
              "token", jsonDecode(response.body)["response"]["accessToken"]);
          pref.setString(
              "mobile", jsonDecode(response.body)["response"]["user"]["phone"]);
          pref.setString("country_code",
              jsonDecode(response.body)["response"]["user"]["country_code"]);

          if (jsonDecode(response.body)["response"]["user"]
                  ["profile_completion"] ==
              0) {
            Get.to(SignupPage());
          } else {
            Get.to(HomePage());
          }
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

  static Future<int> profileCompletion({
    required String name,
    required String username,
    required String bio,
    required String gender,
    required double hip,
    required double neck,
    required double waist,
    required double lat,
    required double lon,
    required double height,
    required double weight,
    required DateTime birthday,
    required int activeness,
  }) async {
    String url = "http://app.geekstudios.tech/user/v1/profile/update";
    print("url $url");
    final uri = Uri.parse(url);

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString("token");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "authorization": "Bearer $accessToken"
    };

    Map<String, dynamic> body = {
      "name": name,
      "username": username,
      "dob": birthday.toString().substring(0, 10),
      "height": height,
      "weight": weight,
      "hip": hip,
      "neck": neck,
      "waist": waist,
      "lat": lat,
      "lon": lon,
      "bio": bio,
      "gender": gender,
      "activeness": activeness
    };
    print(body);
    try {
      http.Response response = await http
          .post(
            uri,
            headers: headers,
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
        Get.to(HomePage());
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

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
