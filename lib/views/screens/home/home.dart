import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stayfit/ai_challenge/challenge_ui.dart';
import 'package:stayfit/api/user_api.dart';
import 'package:stayfit/controller/consumption_controller.dart';
import 'package:stayfit/controller/post_controller.dart';
import 'package:stayfit/controller/profile_controller.dart';
import 'package:stayfit/models/post_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/chat/chat_screen.dart';
import 'package:stayfit/views/screens/chat/normal-chat/all_users_display.dart';
import 'package:stayfit/views/screens/food-cumnsumption/food_consumption_page.dart';
import 'package:stayfit/views/screens/home/home_container_one.dart';
import 'package:stayfit/views/screens/home/home_container_two.dart';
import 'package:stayfit/views/screens/home/linear_progress.dart';
import 'package:stayfit/views/screens/home/post/post_container.dart';
import 'package:stayfit/views/screens/home/steps_count.dart';
import 'package:stayfit/views/screens/notifications/notification_page.dart';
import 'package:stayfit/views/screens/profile/profile_page.dart';
import 'package:stayfit/views/screens/workout/progress-page/progress_page.dart';
import 'package:stayfit/views/wigdets/appbar.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

import '../../wigdets/app_drawer.dart';
import '../workout/workout_select.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final consumtionControler = Get.put(ConsumptionController());
  ProfileController profileController = Get.put(ProfileController());
  PostController postController = Get.put(PostController());

  List<PostModel> postList = [];
  bool profileLoad = false;

  @override
  void initState() {
    // TODO: implement initState
    _init();
    postController.getPosts();

    super.initState();
  }

  _init() async {
    await UserApi.getUser(profileController: profileController);
    setState(() {
      profileLoad = true;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        appBar: appBarCustom(
            title: "",
            shadow: true,
            prefixWidget: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: ChatPageColors.white,
                  size: 22,
                )),
            suffixWidget: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(NotificationPage());
                    },
                    child: Icon(
                      Icons.notifications_rounded,
                      color: ChatPageColors.white,
                      size: 22,
                    )),
              ],
            )),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(defaultPadding),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepsCount(),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ProfileController>(builder: (context) {
                        return Text(
                          "hii ${profileLoad ? profileController.userProfile!.name : ""}",
                          style: TextStyle(color: primaryPurple, fontSize: 20),
                        );
                      }),
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
                Text(
                  " calorie burnt 2655/3250",
                  style: TextStyle(
                      color: ChatPageColors.chatGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
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
                    GestureDetector(
                      onTap: () {
                        Get.to(FoodConsumptionPage());
                      },
                      child: HomeContainerOne(
                        size: size,
                        title: "Food consumption",
                        remark: "1200",
                        text: "calories",
                        percent: .3,
                      ),
                    ),
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
                                builder: (context) => const FriendlyChallenge(
                                      opponent: "Pranav",
                                    )));
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
                        Get.to(WorkoutSelect());
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
                  height: defaultPadding * 2,
                ),
                Text(
                  "Learn More",
                  style: TextStyle(
                      color: ChatPageColors.chatGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                GetBuilder<PostController>(builder: (context) {
                  return Column(children: [
                    for (PostModel post in postController.posts)
                      PostContainer(
                        size: size,
                        post: post,
                        expandCaption: false,
                      )
                  ]);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
