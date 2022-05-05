import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/workout/rest_workout.dart';
import 'package:animated_check/animated_check.dart';

import 'tts.dart';

class Workout extends StatefulWidget {
  Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> with SingleTickerProviderStateMixin {
  final CountDownController _controller = CountDownController();
  late AnimationController _control;

  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _control =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _control, curve: Curves.easeInOutCirc));
  }

  void _showCheckbox() {
    _control.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (item[count]['type'] == 'time') {
      return timeWorkout(context);
    } else {
      return countWorkout(context);
    }
  }

  Widget timeWorkout(BuildContext context) {
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
                      child:
                          Lottie.asset("assets/lotties/" + item[count]["url"])),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(item[count]["title"].toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black87)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 25.0),
                      child: CircularCountDownTimer(
                        textStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 71, 80, 206)),
                        controller: _controller,
                        duration: int.parse(item[count]["time"]),
                        width: MediaQuery.of(context).size.width / 3,

                        // Height of the Countdown Widget.
                        height: MediaQuery.of(context).size.height / 3,

                        // Ring Color for Countdown Widget.
                        isReverse: true,

                        ringColor: Colors.grey[300]!,
                        fillColor: Color.fromARGB(255, 71, 80, 206),
                        backgroundColor: Color.fromARGB(255, 189, 188, 189),
                        onComplete: () {
                          // setState(() {
                          //   count++;
                          //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => rest()));
                          //   speak(item[count]['detail']);
                          // });
                          if (count >= item.length - 1) {
                            // Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext ctx)=> ))
                            Navigator.pop(context);
                            _showCheckbox();
                          } else {
                            count++;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        restWorkout()));
                            speak("Take a rest ,the Next" +
                                item[count]['detail']);
                          }
                        },
                      )),
                ],
              ),
            )),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(193, 170, 171, 173),
                        minimumSize: Size(100, 60),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )),
                    onPressed: () => {_controller.pause()},
                    child: Text("Pause")),
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromRGBO(77, 119, 225, 1),
                        minimumSize: Size(100, 60),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )),
                    onPressed: () => {_controller.resume()},
                    child: Text("Resume"))
              ],
            )));
  }

  Widget countWorkout(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.height * .5,
                        child: Lottie.asset(
                            "assets/lotties/" + item[count]["url"])),
                  ),
                  // TextButton(
                  //     onPressed: () => {speak(_item[count]['detail'])},
                  //     child: Text("speak")),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(item[count]["title"].toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black87)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
                    child: Text(item[count]["time"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black87)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
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
                          if (count >= item.length - 1) {
                            // Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext ctx)=> ))
                            Navigator.pop(context);
                            _showCheckbox();
                          }
                          // setState(() {
                          //   if (count < item.length) {
                          //     count++;
                          //     speak(item[count]['detail']);
                          //   }
                          // });
                          if (count < item.length) {
                            count++;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        restWorkout()));
                            speak("Take a rest .The next " +
                                item[count]['detail']);
                          }
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(fontSize: 26),
                        )),
                  ),
                ],
              ),
            ))));
  }
}
