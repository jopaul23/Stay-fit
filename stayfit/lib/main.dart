import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:stayfit/views/screens/chat/chat_screen.dart';
import 'package:stayfit/views/screens/registration/mobile/mobile_page.dart';
import 'package:stayfit/views/screens/workout/progress-page/progress_page.dart';
import 'package:stayfit/views/screens/workout/workout_screen.dart';
import 'package:stayfit/views/screens/workout/tts.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';

import 'views/constants/constants.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
        fontSize: 16,
        color: primaryPurple,
        fontWeight: FontWeight.w500,
      ),
      child: GetMaterialApp(
        home: MobileEntry(),
      ),
    );
  }
}
