import 'package:flutter/material.dart';
import 'package:stayfit/api/user_api.dart';

import '../../constants/constants.dart';
import '../../wigdets/appbar.dart';

class ListFriends extends StatefulWidget {
  const ListFriends({Key? key}) : super(key: key);

  @override
  State<ListFriends> createState() => _ListFriendsState();
}

class _ListFriendsState extends State<ListFriends> {
  List<UserSimplify> friends = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserApi.getFriends("").then((value) => setState(() {
          friends = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ChatPageColors.bgColor,
            appBar: appBarCustom(
              title: "Friends",
              shadow: false,
            ),
            body: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) =>
                    FriendsCard(user: friends[index]))));
  }
}

class FriendsCard extends StatelessWidget {
  final UserSimplify user;
  const FriendsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          user.profiles.isEmpty
              ? "https://one1onehomeschooling.co.uk/images/avatar3.jpg"
              : user.profiles[0],
        ),
        radius: 50,
      ),
      title: Row(
        children: [
          Text(
            user.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailContainer({required String text, required IconData iconData}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: double.maxFinite,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: primaryPurple.withOpacity(0.1),
            )
          ]),
      child: Row(children: [
        Icon(
          iconData,
          color: primaryPurple,
          size: 24,
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Text(
          text,
          style: TextStyle(color: primaryPurple, fontSize: 16),
        ),
      ]),
    );
  }
}
