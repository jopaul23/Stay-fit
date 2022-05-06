import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:web_socket_channel/io.dart';

class AllChatUsersDisplay extends StatefulWidget {
  const AllChatUsersDisplay({Key? key}) : super(key: key);

  @override
  State<AllChatUsersDisplay> createState() => _AllUsersDisplayState();
}

class _AllUsersDisplayState extends State<AllChatUsersDisplay> {
  final channel =
      IOWebSocketChannel.connect(Uri.parse('ws://10.100.24.187:5000'));
  List<String> recipients = [];

  @override
  void initState() {
    // TODO: implement initState
    channel.sink.add(jsonEncode({"user": "jopi"}));
    channel.sink
        .add(jsonEncode({"command": "get_all_messages", "user": "jopi"}));
    channel.stream.listen((event) {
      Map<String, dynamic> map = jsonDecode(event);
      for (int i = 0; i < map["results"]["recipients"].length; i++) {
        recipients.add(map["results"]["recipients"][i]);
      }
    });

    // .add(jsonEncode({"command": "get_all_messages", "user": "jopi"}));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("recipients $recipients"),
              // StreamBuilder(
              //   stream: channel.stream,
              //   builder: (context, snapshot) {
              //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
