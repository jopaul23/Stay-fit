import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controller.dart';
import 'counter.dart';

class FriendlyChallenge extends StatelessWidget {
  const FriendlyChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00346b),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Friendly Challenge",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            height: 400,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFf5f5f5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GetBuilder<ChallengeController>(
                  init: ChallengeController(),
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: const [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://m.media-amazon.com/images/I/41jLBhDISxL._SY355_.jpg"),
                                  radius: 50,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Naigal",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00346b),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Ready",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, left: 20, right: 20),
                              child: Text(
                                "VS",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00346b),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://m.media-amazon.com/images/I/31Cd9UQp6eL._SX355_.jpg"),
                                  radius: 50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Pranav",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00346b),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                controller.status == Status.ready
                                    ? const Text(
                                        "Ready",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text(
                                        "Waiting",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        controller.status == Status.waiting
                            ? Column(
                                children: [
                                  Text(
                                    "Waiting",
                                    style: const TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  LottieBuilder.asset(
                                    "assets/lottie/wave.json",
                                    height: 100,
                                    width: 100,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Starts In",
                                    style: const TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Counter(maxTime: 15)
                                ],
                              ),
                      ],
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
