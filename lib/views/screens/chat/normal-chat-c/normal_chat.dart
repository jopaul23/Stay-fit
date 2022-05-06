import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/controller/chat_controller.dart';
import 'package:stayfit/models/message_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';
import 'package:web_socket_channel/io.dart';

class NormalChat extends StatefulWidget {
  const NormalChat({Key? key}) : super(key: key);

  @override
  State<NormalChat> createState() => _NormalChatState();
}

class _NormalChatState extends State<NormalChat> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focus = FocusNode();
  ChatController chatController = Get.put(ChatController());
  List<MessageModel> messages = [
    MessageModel(from: "jopi", to: "naigal", message: "Hii Sir,\nGood morning"),
    MessageModel(from: "naigal", to: "jopi", message: "Hii Jopaul"),
    MessageModel(from: "naigal", to: "jopi", message: "GM"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isSender = messages[index].from == "jopi";
                return Padding(
                  padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isSender) Spacer(),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        constraints: BoxConstraints(maxWidth: 200),
                        decoration: BoxDecoration(
                            color: primaryPurple.withOpacity(.8),
                            borderRadius: BorderRadius.only(
                                topLeft: !isSender
                                    ? Radius.circular(0)
                                    : Radius.circular(defaultPadding),
                                topRight: isSender
                                    ? Radius.circular(0)
                                    : Radius.circular(defaultPadding),
                                bottomLeft: Radius.circular(defaultPadding),
                                bottomRight: Radius.circular(defaultPadding))),
                        child: Text(
                          messages[index].message,
                          style: TextStyle(color: white),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
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
                          border: InputBorder.none,
                          hintText: "Enter text here"),
                      showCursor: true,
                      onSubmitted: (value) {
                        final mes = MessageModel(
                            from: "jopi",
                            to: "naigal",
                            message: textEditingController.text);
                        // chatController.addMessage(message: mes);

                        setState(() {
                          messages.add(mes);
                          textEditingController.clear();
                        });
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    focus.unfocus();
                    final mes = MessageModel(
                        from: "jopi",
                        to: "naigal",
                        message: textEditingController.text);
                    // chatController.addMessage(message: mes);

                    setState(() {
                      messages.add(mes);
                      textEditingController.clear();
                    });

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
      ),
    );
  }
}
