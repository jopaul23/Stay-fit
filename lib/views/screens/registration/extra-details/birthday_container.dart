import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';

class BirthdayContainer extends StatelessWidget {
  const BirthdayContainer({
    Key? key,
    required this.birthdayDateString,
    this.width = double.maxFinite,
  }) : super(key: key);

  final double width;
  final String birthdayDateString;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: defaultPadding),
        width: width,
        height: 55,
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
            const SizedBox(
              width: 15,
            ),
            Icon(
              Icons.child_friendly_outlined,
              color: primaryPurple,
              size: 18,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              birthdayDateString == "" ? "birthday" : birthdayDateString,
              style: TextStyle(
                color: primaryPurple.withOpacity(.7),
                fontSize: 16,
              ),
            )
          ],
        ));
  }
}
