import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stayfit/views/constants/constants.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
    required this.currentDay,
  }) : super(key: key);

  final int currentDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg/workout-svg.svg",
          width: MediaQuery.of(context).size.width - 4 * defaultPadding,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(defaultPadding),
          alignment: Alignment.center,
          child: LinearPercentIndicator(
            animation: true,
            barRadius: Radius.circular(10),
            width: MediaQuery.of(context).size.width - defaultPadding * 2,
            lineHeight: 8.0,
            percent: currentDay / (4 * 7),
            progressColor: primaryPurple,
          ),
        )
      ],
    );
  }
}
