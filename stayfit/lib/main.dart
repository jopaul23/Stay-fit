import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:stayfit/views/screens/chat/chat_screen.dart';
import 'package:stayfit/views/screens/workout/progress-page/progress_page.dart';
import 'package:stayfit/views/screens/workout/screen_one.dart';
// import 'package:stayfit/views/screens/workout/workout_screen.dart';
import 'package:stayfit/views/screens/workout/tts.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // home: ProgressPage(),
      home: ProgressPage(),
    );
  }
}
