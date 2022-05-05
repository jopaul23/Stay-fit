import 'package:meta/meta.dart';
import 'dart:convert';

class MessageModel {
  MessageModel({
    required this.from,
    required this.to,
    required this.message,
  });

  String from;
  String to;
  String message;

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        from: json["from"],
        to: json["to"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "message": message,
      };
}
