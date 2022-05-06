import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/ai_challenge/workout.dart';
import 'package:stayfit/models/notification_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class ChallengeContainer extends StatelessWidget {
  const ChallengeContainer({
    Key? key,
    required this.notificaion,
  }) : super(key: key);
  final NotificaionChallengeModel notificaion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: defaultPadding, horizontal: defaultPadding),
      width: double.maxFinite,
      // height: 55,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: primaryPurple.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AI Pushup Challenge",
            style: TextStyle(color: primaryPurple, fontSize: 14),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://one1onehomeschooling.co.uk/images/avatar3.jpg",
                    ),
                    radius: 25,
                  ),
                  Text(
                    notificaion.title,
                    style: TextStyle(
                        color: primaryPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Text(
                "VS",
                style: TextStyle(
                    color: primaryPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://one1onehomeschooling.co.uk/images/avatar3.jpg",
                    ),
                    radius: 25,
                  ),
                  Text(
                    "Jopaul",
                    style: TextStyle(
                        color: primaryPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          RoundedRectPrimaryButton(
              text: "accept match",
              fontsize: 18,
              color: Colors.red,
              height: 35,
              onpressed: () {
                Get.to(WorkoutPage());
              })
        ],
      ),
    );
  }
}
