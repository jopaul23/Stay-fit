import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/views/constants/constants.dart';

PreferredSizeWidget appBarCustom(
    {Widget? prefixWidget,
    required String title,
    Widget? suffixWidget,
    bool? shadow}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56),
    child: Container(
      padding: EdgeInsets.all(defaultPadding),
      // height: 55,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: ChatPageColors.primaryPurple, boxShadow: [
        if (shadow == true)
          BoxShadow(
              color: ChatPageColors.primaryPurple.withOpacity(0.2),
              blurRadius: 20)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixWidget ??
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: ChatPageColors.white,
                    size: 22,
                  )),
          SizedBox(
            width: defaultPadding,
          ),
          Text(title,
              style: TextStyle(
                color: ChatPageColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const Spacer(),
          suffixWidget ?? const SizedBox(),
        ],
      ),
    ),
  );
}
