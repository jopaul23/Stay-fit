import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';
import 'package:stayfit/views/screens/workout/tts.dart';
import 'package:stayfit/views/constants/constants.dart';

class Screen1 extends StatefulWidget {
  String type;
  String day;
  Screen1({Key? key, required this.type, required this.day}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State(type: type, day: day);
}

class _Screen1State extends State<Screen1> {
  // List item = [];
  String type;
  String day;
  _Screen1State({required this.type, required this.day});
  @override
  void initState() {
    super.initState();
    print(type + day);
    readJson(type + day);
  }

  // Fetch content from the json file
  Future<void> readJson(String? type) async {
    final String response =
        await rootBundle.loadString('assets/lotties/initworkout.json');
    final data = await json.decode(response);
    setState(() {
      item = data[type];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // ElevatedButton(
              //   child: const Text('Load Data'),
              //   onPressed: readJson,
              // ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(item[0]["title"].toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color.fromARGB(255, 29, 40, 182))),
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/lotties/Fitnessstats.gif",
                  height: 160,
                  width: 400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item[0]["time"] + "-",
                      style: TextStyle(
                          color: Color.fromARGB(209, 94, 92, 92),
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      (item.length - 1).toString() + "  Workouts ",
                      style: TextStyle(
                          color: Color.fromARGB(209, 94, 92, 92),
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),

              item.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: item.length - 1,
                        itemBuilder: (context, index) {
                          String strTime;
                          if (item[index + 1]["type"] == "time") {
                            strTime = "00." + item[index + 1]["time"];
                          } else {
                            strTime = item[index + 1]["time"];
                          }
                          return Container(
                            height: 75,
                            margin: const EdgeInsets.all(10),
                            child: Center(
                              child: ListTile(
                                title: Center(
                                    child: Row(
                                  children: [
                                    Container(
                                        height: 120,
                                        width: 100,
                                        child: Lottie.asset(
                                            'assets/lotties/' +
                                                item[index + 1]['url'],
                                            fit: BoxFit.contain)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              item[index + 1]['title']
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black87)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6.0),
                                            child: Text(strTime,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      ),
                    )
                  : Container(),
              Center(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: TextButton(
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
                        Future.delayed(Duration(milliseconds: 100), () {
                          // Do something

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      FullWorkout(typeOf: type + day)));
                        });
                        speak("ready to go , the next" + item[1]["detail"]);
                      },
                      child: Text(
                        'START',
                        style: TextStyle(fontSize: 26),
                      )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
