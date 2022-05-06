// To parse this JSON data, do
//
//     final jobModel = jobModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BotMessageModel {
  BotMessageModel({
    required this.message,
    required this.isBot,
  });

  String message;
  int isBot;

  factory BotMessageModel.fromMap(Map<String, dynamic> json) => BotMessageModel(
        message: json["message"],
        isBot: json["is_bot"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "is_bot": isBot,
      };
}
