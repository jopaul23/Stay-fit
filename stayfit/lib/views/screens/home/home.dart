import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          alignment: Alignment.center,
          child: Text("hoem"),
        ),
      ),
    );
  }
}
