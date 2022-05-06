import 'package:flutter/material.dart';
import 'package:stayfit/models/notification_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.notificaion,
  }) : super(key: key);
  final NotificaionRequestModel notificaion;
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://one1onehomeschooling.co.uk/images/avatar3.jpg",
            ),
            radius: 25,
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pranav V",
                style: TextStyle(
                    color: primaryPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                "requested you to follow",
                style: TextStyle(color: primaryPurple, fontSize: 14),
              ),
            ],
          ),
          RoundedRectPrimaryButton(
              text: "accept",
              fontsize: 16,
              color: Colors.green,
              height: 30,
              onpressed: () {})
        ],
      ),
    );
  }
}
