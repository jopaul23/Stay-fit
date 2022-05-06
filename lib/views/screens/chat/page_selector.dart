import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';

Widget pageSelector(
    {required String title,
    required VoidCallback ontap,
    required bool isSelected}) {
  return Expanded(
      child: GestureDetector(
    onTap: ontap,
    child: Column(
      children: [
        Container(
          height: 70,
          color: ChatPageColors.primaryPurple,
          padding: EdgeInsets.all(defaultPadding),
          alignment: Alignment.center,
          child: SizedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  color: isSelected
                      ? ChatPageColors.white
                      : ChatPageColors.primaryPurple),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: isSelected
                        ? ChatPageColors.primaryPurple
                        : ChatPageColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isSelected ? 18 : 18),
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
