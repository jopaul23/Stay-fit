import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/controller/chat_controller.dart';
import 'package:stayfit/models/message_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/chat/normal-chat/trainer_chat_controller.dart';
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

  List<MessageModel> messages = [];
  late String chatId;
  late TrainerChatController chatController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatId = "6272b9de23d223c0dcbdd73f";
    chatController = Get.put(TrainerChatController());

    chatController.streamController.stream.listen((event) {
      final data = jsonDecode(event);
      if (data["command"] == "get_message") {
        print(data["result"]["messages"].length);
        chatId = data["result"]["_id"];
        for (var msg in data["result"]["messages"]) {
          messages.add(MessageModel.fromMap(msg));
        }
      }
    });
    chatController.getMessages("naigal");
  }

  @override
  void dispose() {
    //chatController.streamController.close();

    super.dispose();
  }

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
              child: StreamBuilder(
                  stream: chatController.streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      parseData(jsonDecode(snapshot.data.toString()));
                      return ListView.builder(
                        reverse: true,
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
                                          bottomLeft:
                                              Radius.circular(defaultPadding),
                                          bottomRight:
                                              Radius.circular(defaultPadding))),
                                  child: Text(
                                    messages[index].message,
                                    style: TextStyle(color: white),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("No message to display"));
                    }
                  })),
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
                            from: chatController.user,
                            to: "naigal",
                            message: textEditingController.text);
                        chatController.sendMsg(
                            chatId, "naigal", textEditingController.text);
                        // chatController.addMessage(message: mes);

                        setState(() {
                          messages.insert(0, mes);
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
                    chatController.sendMsg(
                        chatId, "naigal", textEditingController.text);
                    setState(() {
                      messages.insert(0, mes);
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

  void parseData(Map<String, dynamic> data) {
    print(data);
    if (data["command"] == "recivied") {
      messages.insert(0, MessageModel.fromMap(data));
    }
  }
}
