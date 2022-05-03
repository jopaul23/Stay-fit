import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';

import 'tts.dart';

class FullWorkout extends StatefulWidget {
  String? typeOf;
  FullWorkout({Key? key, this.typeOf}) : super(key: key);

  @override
  State<FullWorkout> createState() => _FullWorkoutState(typeOf);
}

class _FullWorkoutState extends State<FullWorkout> {
  String? typeOf;
  List _item = [];
  var count = 1;
  bool isSpeaking = false;
  // FlutterTts flutterTts = FlutterTts();

  _FullWorkoutState(this.typeOf);
  Future<void> read(String? typeOf) async {
    final String response =
        await rootBundle.loadString('asset/initworkout.json');
    final data = await json.decode(response);
    setState(() {
      _item = data[typeOf];
    });

    var length = _item.length;
  }

  @override
  void initState() {
    super.initState();
    // initialize();
  }

  @override
  Widget build(BuildContext context) {
    read(typeOf);
    // print(isSpeaking);
    // isSpeaking ? stop() : speak();

    //flutterTts.speak(_item[count]["detail"]);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                child: Center(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .5,
                      child: Lottie.asset("asset/" + _item[count]["url"])),
                  // TextButton(
                  //     onPressed: () => {speak(_item[count]['detail'])},
                  //     child: Text("speak")),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(_item[count]["title"].toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black87)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                    child: Text(_item[count]["time"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black87)),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(77, 119, 225, 1),
                          minimumSize: Size(300, 60),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          )),
                      onPressed: () {
                        setState(() {
                          if (count < _item.length) {
                            count++;
                            speak(_item[count]['detail']);
                          }
                        });
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 26),
                      )),
                ],
              ),
            ))));
  }
}
