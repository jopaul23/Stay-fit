import 'package:flutter/material.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';
import 'package:web_socket_channel/io.dart';

class NormalChat extends StatefulWidget {
  const NormalChat({Key? key}) : super(key: key);

  @override
  State<NormalChat> createState() => _NormalChatState();
}

class _NormalChatState extends State<NormalChat> {
  final channel =
      IOWebSocketChannel.connect(Uri.parse('ws://192.168.1.98:3000'));
  @override
  void initState() {
    // TODO: implement initState
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
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          StreamBuilder(
            stream: channel.stream,
            builder: (context, snapshot) {
              return Text(snapshot.hasData ? '${snapshot.data}' : '');
            },
          ),
          RoundedRectPrimaryButton(
              text: "GO",
              onpressed: () {
                channel.sink.add('hello');
              }),
        ],
      ),
    );
  }
}
