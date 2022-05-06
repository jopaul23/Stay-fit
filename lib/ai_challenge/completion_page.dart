import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/api/ai_challenge.dart';
import 'package:stayfit/views/constants/constants.dart';

import '../views/wigdets/appbar.dart';

enum AiStatus { win, lose, waiting }

class CompletionPage extends StatefulWidget {
  final int count;
  final String challengeId;
  const CompletionPage(
      {Key? key, required this.count, required this.challengeId})
      : super(key: key);

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  String? msg;
  AiStatus? status;
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    AiChallengeApi.sendData(widget.challengeId, widget.count).then((value) {
      if (value["response_code"] == 210) {
        status = AiStatus.win;
        msg = value["message"];
      } else if (value["response_code"] == 209) {
        status = AiStatus.lose;
        msg = value["message"];
      } else if (value["response_code"] == 202) {
        status = AiStatus.waiting;
        msg = value["message"];
      } else {
        msg = value["message"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ChatPageColors.bgColor,
        appBar: appBarCustom(
          title: "Ai Challenge",
          shadow: false,
        ),
        body: msg == null
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  Text(
                    msg!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: primaryPurple),
                  ),
                  if (status == AiStatus.win)
                    Align(
                      alignment: Alignment.center,
                      child: ConfettiWidget(
                        confettiController: _controllerCenter,
                        blastDirectionality: BlastDirectionality
                            .explosive, // don't specify a direction, blast randomly
                        shouldLoop:
                            true, // start again as soon as the animation is finished
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple
                        ], // manually specify the colors to be used
                        // define a custom shape/path.
                      ),
                    )
                ],
              ));
  }
}
