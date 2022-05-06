import 'package:stayfit/models/user_model.dart';

class NotificationModel {
  final String title;
  final String type;
  final String requestId;
  NotificationModel(
      {required this.title, required this.type, required this.requestId});
}

class NotificaionRequestModel extends NotificationModel {
  NotificaionRequestModel({
    required String title,
    required this.body,
    required String type,
    required String requestId,
  }) : super(title: title, type: type, requestId: requestId);

  String body;

  factory NotificaionRequestModel.fromMap(Map<String, dynamic> json) =>
      NotificaionRequestModel(
        title: json["title"],
        body: json["body"],
        type: json["type"],
        requestId: json["request_id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "body": body,
        "type": type,
        "request_id": requestId,
      };
}

class NotificaionChallengeModel extends NotificationModel {
  NotificaionChallengeModel({
    required this.oponent,
    required String type,
    required String requestId,
  }) : super(title: "", type: type, requestId: requestId);

  final UserModel oponent;
  factory NotificaionChallengeModel.fromMap(
          Map<String, dynamic> json, UserModel oponent) =>
      NotificaionChallengeModel(
        oponent: oponent,
        type: json["type"],
        requestId: json["request_id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "type": type,
        "request_id": requestId,
      };
}
