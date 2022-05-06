import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/api/notification_api.dart';
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
  List<NotificationModel> notifications = [];
  @override
  void initState() {
    NotificationApi.getNotifications().then((value) => setState(() {
          notifications = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBarCustom(title: "Notification Page"),
          backgroundColor: white,
          body: Column(
            children: [
              for (NotificationModel notificaion in notifications)
                notificaion is NotificaionRequestModel
                    ? NotificationContainer(notificaion: notificaion)
                    : ChallengeContainer(
                        notificaion: notificaion as NotificaionChallengeModel),
            ],
          )),
    );
  }
}
