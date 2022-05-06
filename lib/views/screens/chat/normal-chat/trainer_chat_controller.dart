import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class TrainerChatController extends GetxController {
  late IOWebSocketChannel channel;
  late StreamController streamController;
  final String user = "jopi";
  TrainerChatController() {
    channel = IOWebSocketChannel.connect("ws://159.89.161.168:5003");
    streamController = StreamController.broadcast();
    streamController.addStream(channel.stream);
    channel.sink.add(jsonEncode({
      "user": user,
    }));
  }

  void sendMsg(String id, String to, String msg) {
    channel.sink.add(jsonEncode({
      "chat_id": id,
      "from": user,
      "to": to,
      "message": msg,
      "command": "send"
    }));
  }

  void getAllMessages() {
    channel.sink.add(jsonEncode({"user": user, "command": "get_all_messages"}));
  }

  void getMessages(recivier) {
    channel.sink.add(jsonEncode(
        {"sender": user, "command": "get_message", "reciver": recivier}));
  }
}
