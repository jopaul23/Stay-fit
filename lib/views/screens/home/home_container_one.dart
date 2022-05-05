import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/linear_progress.dart';

class HomeContainerOne extends StatelessWidget {
  const HomeContainerOne({
    Key? key,
    required this.size,
    required this.title,
    required this.remark,
    required this.text,
    required this.percent,
  }) : super(key: key);

  final Size size;
  final String title;

  final String remark;
  final String text;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (size.width - defaultPadding * 4) / 2,
      width: (size.width - defaultPadding * 4) / 2,
      decoration: BoxDecoration(
        color: primaryPurple,
        borderRadius: BorderRadius.circular(defaultPadding),
      ),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: white,
              fontSize: 16,
            ),
          ),
          Text(
            remark,
            style: TextStyle(
              color: ChatPageColors.chatGrey,
              fontSize: 30,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          LinearProgressBarCustom(
            size: size,
            percent: percent,
            width: (size.width - defaultPadding * 4) / 2,
          ),
        ],
      ),
    );
  }
}
