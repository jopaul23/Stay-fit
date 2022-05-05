import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/chat/page_selector.dart';
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
        appBar: appBarCustom(
          title: "Triner/Dietitian Page",
          shadow: false,
        ),
        body: Column(
          children: const [
            // ClipRRect(
            //   borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(defaultPadding),
            //       bottomRight: Radius.circular(defaultPadding)),
            //   child: Row(
            //     children: [
            //       pageSelector(
            //           title: "Fitty Assist",
            //           ontap: () {
            //             setState(() {
            //               selected = 0;
            //             });
            //           },
            //           isSelected: selected == 0),
            //       pageSelector(
            //           title: "Trainers/Dietitians",
            //           ontap: () {
            //             setState(() {
            //               selected = 1;
            //             });
            //           },
            //           isSelected: selected == 1),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: defaultPadding,
            // ),
            Expanded(
              child: NormalChat(),
            )
          ],
        ),
      ),
    );
  }
}
