import 'dart:convert';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/workout/rest_workout.dart';
import 'package:stayfit/views/screens/workout/workout.dart';

import 'tts.dart';

class FullWorkout extends StatefulWidget {
  String? typeOf;
  FullWorkout({Key? key, this.typeOf}) : super(key: key);

  @override
  State<FullWorkout> createState() => _FullWorkoutState(typeOf);
}

class _FullWorkoutState extends State<FullWorkout> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();
  final CountDownController _restController = CountDownController();

  String? typeOf;
  
  bool isSpeaking = false;
  // FlutterTts flutterTts = FlutterTts();

  _FullWorkoutState(this.typeOf) {
    // read(typeOf);
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // initialize();
  // }

  @override
  Widget build(BuildContext context) {
    count = 1;
    Future.delayed(Duration(milliseconds: 1000), () => {});

    return restWorkout();
  }

  // Widget rest() {
  //   return ;
  // }

  // Widget timeWorkout() {
  //   return;
  // }

}
