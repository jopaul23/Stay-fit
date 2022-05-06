import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stayfit/api/user_api.dart';
import 'package:stayfit/models/user_model.dart';

class NearByFriends extends StatefulWidget {
  const NearByFriends({Key? key}) : super(key: key);

  @override
  State<NearByFriends> createState() => _NearByFriendsState();
}

class _NearByFriendsState extends State<NearByFriends> {
  List<UserModel> users = [];
  bool connected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserApi.getNearbyUsers("10").then((value) async {
      await Future.delayed(Duration(seconds: 4));
      setState(() {
        connected = true;
        users = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Text(
            "Friends near you",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          connected
              ? Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: ((context, index) {
                        return _card(users[index]);
                      })),
                )
              : LottieBuilder.asset(
                  "assets/lotties/wave.json",
                  height: 200,
                  width: 200,
                )
        ],
      ),
    );
  }

  Widget _card(UserModel user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          user.profileImages.isEmpty
              ? "https://one1onehomeschooling.co.uk/images/avatar3.jpg"
              : user.profileImages[0],
        ),
        radius: 50,
      ),
      title: Text(user.name),
      subtitle: Text("127 bmi"),
      trailing: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
