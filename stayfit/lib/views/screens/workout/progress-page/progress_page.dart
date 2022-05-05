import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/workout/progress-page/top_container.dart';
import 'package:stayfit/views/screens/workout/screen_one.dart';
import 'package:stayfit/views/wigdets/appbar.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int currentDay = 2;
  @override
  Widget build(BuildContext context) {
    currentDay = 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ProgressPageColor.bgColor,
        appBar: appBarCustom(title: "7x4 Challenges", shadow: false),
        body: Column(
          children: [
            TopContainer(currentDay: currentDay),
            SizedBox(
              height: defaultPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      for (int k = 0; k < 4; k++)
                        Column(
                          children: [
                            titleRow(currentDate: currentDay, week: k + 1),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20 - 2,
                                ),
                                Container(
                                  height: 150,
                                  width: 4,
                                  color: k <= (currentDay / 7).floor()
                                      ? primaryPurple
                                      : ProgressPageColor.chatGrey,
                                ),
                                SizedBox(
                                  width: defaultPadding,
                                ),
                                Expanded(
                                  child: Container(
                                    color: white,
                                    padding:
                                        EdgeInsets.all(defaultPadding * 1.5),
                                    child: Column(
                                      children: [
                                        for (int i = 0; i < 2; i++)
                                          Column(
                                            children: [
                                              if (i == 1)
                                                SizedBox(
                                                  height: defaultPadding,
                                                ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int j = 0; j < 4; j++)
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (k * 7 +
                                                                i * 4 +
                                                                j +
                                                                1 <=
                                                            currentDay) {
                                                          Get.to(Screen1(
                                                              type: "fullbody",
                                                              day: (i * 4 +
                                                                      j +
                                                                      1)
                                                                  .toString()));
                                                        }
                                                      },
                                                      child: completedDay(
                                                          day: 4 * i + j + 1,
                                                          currentDay:
                                                              currentDay,
                                                          week: k + 1),
                                                    )
                                                ],
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            RoundedRectPrimaryButton(
              width: 150,
              text: "Go !",
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget completedWeek({required bool check}) {
  return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: check ? primaryPurple : ProgressPageColor.chatGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      child: Icon(
        check ? Icons.check : Icons.battery_charging_full,
        color: white,
      ));
}

Widget titleRow({required int currentDate, required int week}) {
  return Row(
    children: [
      completedWeek(
        check: week - 1 <= (currentDate / 7).floor(),
      ),
      SizedBox(
        width: defaultPadding,
      ),
      Text(
        "week ${week}",
        style: TextStyle(
          color: week - 1 == (currentDate / 7).floor()
              ? primaryPurple
              : ProgressPageColor.chatGrey,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ],
  );
}

Widget completedDay(
    {required int day, required int currentDay, required int week}) {
  return Row(
    children: [
      if (day % 4 != 1)
        Row(
          children: [
            Icon(
              Icons.arrow_right_outlined,
              color: day <= currentDay
                  ? primaryPurple
                  : ProgressPageColor.chatGrey,
            ),
            SizedBox(
              width: defaultPadding,
            ),
          ],
        ),
      day == 8
          ? SvgPicture.asset(
              "assets/svg/trophy-grey.svg",
              color: (week - 1) < (currentDay / 7).floor()
                  ? Colors.orange
                  : ProgressPageColor.chatGrey,
              height: 30,
            )
          : Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color:
                      day + (week - 1) * 7 < currentDay ? primaryPurple : white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: currentDay == day + (week - 1) * 7
                        ? primaryPurple
                        : ProgressPageColor.chatGrey,
                  )),
              alignment: Alignment.center,
              child: day + (week - 1) * 7 < currentDay
                  ? Icon(
                      Icons.check,
                      color: white,
                    )
                  : Text(
                      day.toString(),
                      style: TextStyle(
                        color: currentDay == day + (week - 1) * 7
                            ? primaryPurple
                            : ProgressPageColor.chatGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
    ],
  );
}
