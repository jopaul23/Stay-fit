import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/api/register_api.dart';
import 'package:stayfit/api/user_api.dart';
import 'package:stayfit/controller/profile_controller.dart';
import 'package:stayfit/models/user_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/appbar.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userProfile;
  const ProfilePage({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(title: "profile"),
        body: GetBuilder<ProfileController>(builder: (context) {
          return Container(
            width: size.width,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: defaultPadding, horizontal: defaultPadding),
                    width: double.maxFinite,
                    // height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: primaryPurple.withOpacity(0.1),
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            userProfile.profileImages.isEmpty
                                ? "https://one1onehomeschooling.co.uk/images/avatar3.jpg"
                                : userProfile.profileImages[0],
                          ),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProfile.name,
                              style: TextStyle(
                                  color: primaryPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "${userProfile.connectedUsers.length} friends",
                              style: TextStyle(
                                  color: primaryPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Text(
                    "other details",
                    style: TextStyle(
                        color: primaryPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        detailContainer(
                            text: userProfile.username.toString(),
                            iconData: Icons.person),
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(minHeight: 65),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: primaryPurple.withOpacity(0.1),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bio",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryPurple,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                userProfile.bio,
                                style: TextStyle(
                                    color: primaryPurple, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        detailContainer(
                            text: userProfile.phone, iconData: Icons.call),
                        detailContainer(
                            text: userProfile.bmi.toString(),
                            iconData: Icons.health_and_safety),
                        detailContainer(
                            text: userProfile.dob.toString().substring(0, 10),
                            iconData: Icons.baby_changing_station),
                        detailContainer(
                            text: userProfile.gender, iconData: Icons.male),
                        detailContainer(
                            text: userProfile.height.toString(),
                            iconData: Icons.height),
                        detailContainer(
                            text: userProfile.weight.toString(),
                            iconData: Icons.line_weight),
                        detailContainer(
                            text: userProfile.hip.toString(),
                            iconData: Icons.hive_sharp),
                        detailContainer(
                            text: userProfile.waist.toString(),
                            iconData: Icons.blender_outlined),

                        // detailContainer(
                        //     text: profileController.userProfile!.phone,
                        //     iconData: Icons.),
                        // detailContainer(
                        //     text: profileController.userProfile!.phone,
                        //     iconData: Icons.call),
                      ],
                    ),
                  ))
                ]),
          );
        }),
      ),
    );
  }
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
