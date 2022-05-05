import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/views/screens/chat/chat_screen.dart';
import 'package:stayfit/views/screens/home/home.dart';
import 'package:stayfit/views/screens/registration/extra-details/extra_details.dart';
import 'package:stayfit/views/screens/registration/mobile/mobile_page.dart';

import 'views/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
        fontSize: 16,
        color: primaryPurple,
        fontWeight: FontWeight.w500,
      ),
      child: GetMaterialApp(
        home: ChatScreen(),
      ),
    );
  }
}
