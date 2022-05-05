import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stayfit/ai_challenge/challenge_ui.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/chat/chat_screen.dart';
import 'package:stayfit/views/screens/chat/normal-chat/all_users_display.dart';
import 'package:stayfit/views/screens/food-cumnsumption/food_consumption_page.dart';
import 'package:stayfit/views/screens/home/home_container_one.dart';
import 'package:stayfit/views/screens/home/home_container_two.dart';
import 'package:stayfit/views/screens/home/linear_progress.dart';
import 'package:stayfit/views/screens/workout/progress-page/progress_page.dart';
import 'package:stayfit/views/wigdets/appbar.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(
            title: "",
            shadow: true,
            prefixWidget: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.menu,
                  color: ChatPageColors.white,
                  size: 22,
                )),
            suffixWidget: Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.account_box_rounded,
                      color: ChatPageColors.white,
                      size: 22,
                    )),
                const SizedBox(
                  width: defaultPadding,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications_rounded,
                      color: ChatPageColors.white,
                      size: 22,
                    )),
                const SizedBox(
                  width: defaultPadding,
                ),
                InkWell(
                    onTap: () {
                      Get.to(AllChatUsersDisplay());
                    },
                    child: Icon(
                      Icons.chat_rounded,
                      color: ChatPageColors.white,
                      size: 22,
                    )),
              ],
            )),
        backgroundColor: white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(defaultPadding),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "hii Jopaul Joy",
                      style: TextStyle(color: primaryPurple, fontSize: 20),
                    ),
                    Text(
                      "Stay Fit! Stay heathy",
                      style: TextStyle(color: primaryPurple, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeContainerOne(
                    size: size,
                    title: "Daily Workout Status",
                    remark: "78%",
                    text: "complete",
                    percent: .3,
                  ),
                  HomeContainerOne(
                    size: size,
                    title: "Daily Calorie Status",
                    remark: "3000",
                    text: "calories",
                    percent: .3,
                  )
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FriendlyChallenge()));
                    },
                    child: HomeContainerTwo(
                        size: size,
                        title: "AI Workout\nChallenge",
                        image: "assets/png/ai-png.png",
                        buttonText: "participate",
                        ontap: () {}),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProgressPage());
                    },
                    child: HomeContainerTwo(
                        size: size,
                        title: "Workout!\nstay fit",
                        image: "assets/png/dumbell-png.png",
                        buttonText: "participate",
                        ontap: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(FoodConsumptionPage());
                    },
                    child: HomeContainerOne(
                      size: size,
                      title: "Food consumption Status",
                      remark: "1200",
                      text: "calories",
                      percent: .3,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
