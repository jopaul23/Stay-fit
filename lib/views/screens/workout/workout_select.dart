import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/home_container_two.dart';
import 'package:stayfit/views/screens/workout/individual_workout.dart';
import 'package:stayfit/views/screens/workout/progress-page/progress_page.dart';
import 'package:stayfit/views/screens/workout/screen_one.dart';

class WorkoutSelect extends StatelessWidget {
  const WorkoutSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ProgressPageColor.bgColor,
            body: Container(
              child: ListView(
                children: [
                  Text(""),
                  GestureDetector(
                    onTap: () => {Get.to(ProgressPage())},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 130,
                      decoration: BoxDecoration(color: Color.fromARGB(239, 240, 155, 28)),
                      child: Center(
                        child:  ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/workout-svg.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Workout Generated\n for You  ",
                                        style: TextStyle(
                                          color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("7X4 workout",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {Get.to(ProgressPage())},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child:  ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 150,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/undraw_biking_kc-4-f.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("FULL BODY",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 6.0),
                                      child: Text("7X4 workout",
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
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 8.0, bottom: 8),
                    child: Text("Beginner",
                        style: TextStyle(color: Colors.grey, fontSize: 22)),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "abs", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/3297115.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ABS Beginner",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "chest", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/undraw_personal_trainer_ote3.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("CHEST Beginner",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "arm", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  child:SvgPicture.asset("assets/svg/undraw_working_out_re_nhkg.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ARM Beginner",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "leg", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child:  SvgPicture.asset("assets/svg/undraw_indoor_bike_pwa4.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("LEG Beginner",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, top: 8.0, bottom: 8),
                    child: Text("Intermediate",
                        style: TextStyle(color: Colors.grey, fontSize: 22)),
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "abs", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/3297115.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ABS Intermediate",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "chest", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child:  SvgPicture.asset("assets/svg/undraw_personal_trainer_ote3.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("CHEST Intermediate",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "arm", day: "beginner"))},
                    child: Container(
                       margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/undraw_working_out_re_nhkg.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ARM Intermediate",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 6),
                  GestureDetector(
                    onTap: () =>
                        {Get.to(Screen1(type: "leg", day: "beginner"))},
                    child: Container(
                      margin: EdgeInsets.all(defaultPadding),
                      height: 120,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: ListTile(
                          title: Center(
                              child: Row(
                            children: [
                              Container(
                                  height: 120,
                                  width: 100,
                                  child: SvgPicture.asset("assets/svg/undraw_indoor_bike_pwa4.svg")),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("LEG Intermediate",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(top: 6.0),
                                    //   child: Text("",
                                    //       style: TextStyle(
                                    //           color: Colors.grey,
                                    //           fontSize: 16)),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
