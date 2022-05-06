import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/api/notification_api.dart';
import 'package:stayfit/controller/notification_controller.dart';
import 'package:stayfit/models/notification_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/notifications/challenge_container.dart';
import 'package:stayfit/views/screens/notifications/notification_containeer.dart';
import 'package:stayfit/views/wigdets/appbar.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationController notificationController =
      Get.find<NotificationController>();
  @override
  void initState() {
    // TODO: implement initState
    NotificationApi.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(title: "Notification Page"),
        backgroundColor: white,
        body: GetBuilder<NotificationController>(builder: (context) {
          return Column(
            children: [
              for (NotificaionModel notificaion
                  in notificationController.notifications)
                notificaion.type == "request"
                    ? NotificationContainer(notificaion: notificaion)
                    : ChallengeContainer(notificaion: notificaion),
              ChallengeContainer(
                  notificaion: NotificaionModel(
                      body: "", title: "R Sreyas", type: "", requestId: "")),
            ],
          );
        }),
      ),
    );
  }
}
