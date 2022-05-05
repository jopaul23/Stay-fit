import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(title: "profile"),
        body: Column(children: [
          const SizedBox(
            height: defaultPadding,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://cdn.dribbble.com/users/2364329/screenshots/5930135/aa.jpg"),
            radius: 30,
          )
        ]),
      ),
    );
  }
}
