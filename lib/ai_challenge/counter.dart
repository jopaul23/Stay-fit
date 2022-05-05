import 'dart:async';

import 'package:flutter/material.dart';

import 'workout.dart';

class Counter extends StatefulWidget {
  final int maxTime;
  const Counter({Key? key, required this.maxTime}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  String display = "";
  @override
  void initState() {
    super.initState();

    count = widget.maxTime;

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      while (count > 0) {
        count--;
        if (count == 3) {
          display = "Get";
        } else if (count == 2) {
          display = "Set";
        } else if (count <= 1) {
          display = "Go";
        } else {
          display = count.toString();
        }
        setState(() {});
        await Future.delayed(Duration(seconds: 1));
      }

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WorkoutPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      display,
      style: TextStyle(
          color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
