import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/controller/profile_controller.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/find_near_friends.dart/find_friends.dart';

import '../screens/chat/chat_screen.dart';
import '../screens/profile/profile_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontWeight: FontWeight.normal, color: Colors.white, fontSize: 16);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 250,
      color: primaryPurple,
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              final ProfileController profileController =
                  Get.find<ProfileController>();
              Get.to(ProfilePage(userProfile: profileController.userProfile!));
            },
            leading: Icon(
              Icons.account_box_rounded,
              color: ChatPageColors.white,
              size: 22,
            ),
            title: const Text(
              "Profile Page",
              style: textStyle,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(const FindFriends());
            },
            leading: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: const Text(
              "Find near by friends",
              style: textStyle,
            ),
          ),
          ListTile(
              onTap: () {
                Get.to(const ChatScreen());
              },
              title: const Text(
                "Chat to Trainer",
                style: textStyle,
              ),
              leading: Icon(
                Icons.chat_rounded,
                color: ChatPageColors.white,
                size: 22,
              )),
        ],
      ),
    );
  }
}
