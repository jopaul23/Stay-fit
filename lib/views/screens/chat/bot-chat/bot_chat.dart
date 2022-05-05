import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/controller/chat_controller.dart';
import 'package:stayfit/models/message_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';
import 'package:web_socket_channel/io.dart';

class BotChat extends StatefulWidget {
  const BotChat({Key? key}) : super(key: key);

  @override
  State<BotChat> createState() => _BotChatState();
}

class _BotChatState extends State<BotChat> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focus = FocusNode();
  ChatController chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    // currentFocus = FocusScope.of(context);

    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(),
        )),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(defaultPadding),
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      color: ChatPageColors.chatGrey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(defaultPadding)),
                  child: TextField(
                    controller: textEditingController,
                    focusNode: focus,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter text here"),
                    showCursor: true,
                    onSubmitted: (value) {},
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  focus.unfocus();
                  // final mes = BotMessageModel(
                  //     isBot: 0, message: textEditingController.text);
                  // chatController.addMessage(message: mes);
                  print("success from app");
                },
                child: Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(
                      bottom: defaultPadding,
                      top: defaultPadding,
                      right: defaultPadding),
                  decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(defaultPadding)),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.send,
                    color: white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
