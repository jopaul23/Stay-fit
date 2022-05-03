import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:stayfit/views/screens/workout/screen_one.dart';
import 'package:stayfit/views/screens/workout/tts.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Screen1(),
    );
  }
}
