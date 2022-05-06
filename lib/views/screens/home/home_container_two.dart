import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class HomeContainerTwo extends StatelessWidget {
  const HomeContainerTwo({
    Key? key,
    required this.size,
    required this.title,
    required this.image,
    required this.buttonText,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final String title;
  final VoidCallback ontap;
  final String buttonText;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (size.width) / 2,
      width: (size.width - defaultPadding * 4) / 2,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Image.asset(
            image,
            height: 40,
          ),
          RoundedRectPrimaryButton(
            text: buttonText,
            onpressed: ontap,
            color: white,
            fontsize: 16,
            textColor: primaryPurple,
          )
        ],
      ),
    );
  }
}
