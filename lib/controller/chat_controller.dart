import 'package:get/get.dart';
import 'package:stayfit/api/sqflite_api.dart';
import 'package:stayfit/models/message_model.dart';

class ChatController extends GetxController {
  final sqfDb = SqfDb.instance;

  // List<BotMessageModel> messages = [];

  getMessages() async {
    List<Map<String, dynamic>> chatsMap = await sqfDb.getChats();
    // messages.clear();
    print("-------------response from db--------------");
    print(chatsMap);
    print("-------------response from db--------------");

    for (Map<String, dynamic> chatMap in chatsMap) {
      // messages.add(BotMessageModel.fromMap(chatMap));
    }
    update();
  }

  // addMessage({required BotMessageModel message}) {
  //   Map<String, dynamic> val = message.toMap();
  //   sqfDb.insertMessage(messageMap: val);
  //   getMessages();
  //   print("successfully inserted");
  // }
}
