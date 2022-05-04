import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/appbar.dart';
import 'package:stayfit/views/screens/chat/bot-chat/bot_chat.dart';
import 'package:stayfit/views/screens/chat/normal-chat/normal_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ChatPageColors.bgColor,
        appBar: appBarCustom(title: "Chat Page"),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(defaultPadding),
                  bottomRight: Radius.circular(defaultPadding)),
              child: Row(
                children: [
                  pageSelector(
                      title: "Fitty Assist",
                      ontap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      isSelected: selected == 0),
                  pageSelector(
                      title: "Trainers/Dietitians",
                      ontap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      isSelected: selected == 1),
                ],
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            selected == 0 ? BotChat() : NormalChat(),
          ],
        ),
      ),
    );
  }
}

Widget pageSelector(
    {required String title,
    required VoidCallback ontap,
    required bool isSelected}) {
  return Expanded(
      child: GestureDetector(
    onTap: ontap,
    child: Column(
      children: [
        Container(
          height: 70,
          color: ChatPageColors.primaryPurple,
          padding: EdgeInsets.all(defaultPadding),
          alignment: Alignment.center,
          child: SizedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  color: isSelected
                      ? ChatPageColors.white
                      : ChatPageColors.primaryPurple),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: isSelected
                        ? ChatPageColors.primaryPurple
                        : ChatPageColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isSelected ? 18 : 18),
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
