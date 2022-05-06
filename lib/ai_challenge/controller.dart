import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum Status { ready, waiting }

class ChallengeController extends GetxController {
  Status _status = Status.ready;
  Status get status => _status;
  int myCount = 0, userCount = 0;
  void changeStatus(Status newStatus) {
    _status = newStatus;
    update();
  }

  late WebSocket socket;

  Future<bool> connect() async {
    bool connected = false;
    try {
      socket = await WebSocket.connect("ws://10.100.24.187:5001");
      connected = true;
      socket.listen((event) {
        final data = jsonDecode(event);
        if (data["command"].toString().toLowerCase() == "recivied") {
          userCount = data["count"];
          update(["user_count"]);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return connected;
  }

  void sendData(int count) {
    final data = {
      "user": "naigal",
      "command": "data",
      "user1": "pranav",
      "count": count
    };
    socket.add(jsonEncode(data));
  }
}
