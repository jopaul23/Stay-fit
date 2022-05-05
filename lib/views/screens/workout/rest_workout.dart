import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/workout/tts.dart';
import 'package:stayfit/views/screens/workout/workout.dart';
import 'package:audioplayers/audioplayers.dart';

class restWorkout extends StatelessWidget {
  restWorkout({Key? key}) : super(key: key);
  final CountDownController _restController = CountDownController();
  String command = "Get Ready";
  @override
  Widget build(BuildContext context) {
    if (count != 1) {
      command = "Next";
    }
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
                  child: Lottie.asset("assets/lotties/" + item[count]["url"]),
                ),
                Text(
                  command,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(item[count]["title"].toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black87)),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 13.0, bottom: 15.0),
                    child: CircularCountDownTimer(
                      textStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 71, 80, 206)),
                      controller: _restController,
                      duration: 10,
                      width: MediaQuery.of(context).size.width / 3,

                      // Height of the Countdown Widget.
                      height: MediaQuery.of(context).size.height / 3,

                      // Ring Color for Countdown Widget.
                      isReverse: true,

                      ringColor: Colors.grey[300]!,
                      fillColor: Color.fromARGB(255, 71, 80, 206),
                      backgroundColor: Color.fromARGB(255, 189, 188, 189),
                      onComplete: () {
                        _restController.pause();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) => Workout()));

                        AudioCache player = new AudioCache();
                        player.play("lotties/whistle.mp3");

                        Future.delayed(Duration(seconds: 1), () {
                          speak("start" + item[count]['detail']);
                        });
                      },
                    )),
              ],
            )))));
  }
}
