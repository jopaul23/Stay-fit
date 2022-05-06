import 'package:meta/meta.dart';
import 'dart:convert';

class NotificaionModel {
  NotificaionModel({
    required this.title,
    required this.body,
    required this.type,
    required this.requestId,
  });

  String title;
  String body;
  String type;
  String requestId;

  factory NotificaionModel.fromMap(Map<String, dynamic> json) =>
      NotificaionModel(
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
