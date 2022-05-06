import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';
import 'package:stayfit/views/screens/workout/tts.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson(String? type) async {
    final String response =
        await rootBundle.loadString('asset/lotties/initworkout.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[type];
    });
  }

  @override
  Widget build(BuildContext context) {
    String type = "fullbody1";

    readJson(type);
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
                  child: Text(_items[0]["title"].toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ),
              ),
              Container(
                child: Image.asset(
                  "asset/lotties/Fitnessstats.gif",
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
                      _items[0]["time"] + "-",
                      style: TextStyle(color: Colors.black12, fontSize: 16),
                    ),
                    Text(
                      (_items.length - 1).toString() + "  Workouts ",
                      style: TextStyle(color: Colors.black12, fontSize: 16),
                    ),
                  ],
                ),
              ),

              _items.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: _items.length - 1,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 75,
                            margin: const EdgeInsets.all(10),
                            child: Center(
                              child: ListTile(
                                title: Center(
                                    child: Row(
                                  children: [
                                    Container(
                                        height: 150,
                                        width: 100,
                                        child: Lottie.asset('asset/lotties/' +
                                            _items[index + 1]['url'])),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              _items[index + 1]['title']
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black87)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6.0),
                                            child: Text(
                                                _items[index + 1]["time"],
                                                style: TextStyle(
                                                    color: Colors.grey)),
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
                                  builder: (ctx) => FullWorkout(typeOf: type)));
                        });
                        speak(_items[1]["detail"]);
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
