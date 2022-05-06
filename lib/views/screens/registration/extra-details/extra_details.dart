import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stayfit/api/register_api.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stayfit/views/screens/registration/extra-details/bio_container.dart';
import 'package:stayfit/views/screens/registration/extra-details/birthday_container.dart';
import 'package:stayfit/views/screens/registration/extra-details/calender_overlay.dart';
import 'package:stayfit/views/wigdets/buttons/rounded_rect.dart';
import 'package:stayfit/views/wigdets/drop-down/dropdown.dart';
import 'package:stayfit/views/wigdets/textfield_custom.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final bioCntroller = TextEditingController();
  final hipCntroller = TextEditingController();
  final waistCntroller = TextEditingController();
  final neckCntroller = TextEditingController();
  DateTime? birthdayDate;
  String birthdayString = "";
  String gender = "";
  bool loading = false;
  List<String> genders = ["male", "female", "other"];
  List<String> works = [
    "little",
    "light",
    "moderate",
    "active",
    "highly active"
  ];
  int work = -1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/svg/workout-svg.svg",
                  width: size.width - defaultPadding * 4,
                ),
                const Text(
                  "More about you!",
                  style: TextStyle(
                    fontSize: 19,
                    color: primaryPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Enter the following details to continue",
                  style: TextStyle(
                    fontSize: 10,
                    color: primaryPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      TextFieldCustom(
                        hintText: "name",
                        textEditingController: nameController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      TextFieldCustom(
                        hintText: "username",
                        textEditingController: usernameController,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldCustom(
                            width: 160,
                            keyboardType: TextInputType.number,
                            hintText: "height(in cm)",
                            textEditingController: heightController,
                          ),
                          SizedBox(
                            height: defaultPadding * 2,
                          ),
                          TextFieldCustom(
                            width: 160,
                            keyboardType: TextInputType.number,
                            hintText: "weight(in kg)",
                            textEditingController: weightController,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      DropDownCustom(
                          items: genders,
                          dropdownChanged: (value) {
                            setState(() {
                              gender = genders[value];
                            });
                          },
                          text: "gender"),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldCustom(
                            width: gender == "female" ? 100 : 160,
                            keyboardType: TextInputType.number,
                            hintText: "neck length(in cm)",
                            textEditingController: neckCntroller,
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          TextFieldCustom(
                            width: gender == "female" ? 100 : 160,
                            keyboardType: TextInputType.number,
                            hintText: "waist(in cm)",
                            textEditingController: waistCntroller,
                          ),
                          if (gender == "female")
                            Row(
                              children: [
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                TextFieldCustom(
                                  width: 100,
                                  keyboardType: TextInputType.number,
                                  hintText: "hip(in cm)",
                                  textEditingController: hipCntroller,
                                ),
                              ],
                            )
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding * 2,
                      ),
                      DropDownCustom(
                          items: works,
                          dropdownChanged: (value) {
                            setState(() {
                              work = value;
                            });
                          },
                          text: "work type"),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      BioField(
                        textEditingController: bioCntroller,
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      GestureDetector(
                          onTap: () {
                            late OverlayEntry calenderOverlay;
                            calenderOverlay = OverlayEntry(
                                builder: (context) => CalenderOverlay(
                                    onDateChanged: (date) {
                                      setState(() {
                                        birthdayDate = date;
                                        birthdayString = _toDMY(date);
                                        calenderOverlay.remove();
                                      });
                                    },
                                    calenderOverlay: calenderOverlay));
                            Overlay.of(context)?.insert(calenderOverlay);
                          },
                          child: BirthdayContainer(
                              birthdayDateString: birthdayString)),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      RoundedRectPrimaryButton(
                          loading: loading,
                          text: "Continue",
                          onpressed: () async {
                            setState(() {
                              loading = true;
                            });
                            Position position = await determinePosition();

                            RegisterApi.profileCompletion(
                                    activeness: work,
                                    name: nameController.text,
                                    username: usernameController.text,
                                    bio: bioCntroller.text,
                                    gender: gender,
                                    hip: gender == "female"
                                        ? double.parse(hipCntroller.text)
                                        : 0,
                                    neck: double.parse(neckCntroller.text),
                                    waist: double.parse(waistCntroller.text),
                                    lat: position.latitude,
                                    lon: position.longitude,
                                    height: double.parse(heightController.text),
                                    weight: double.parse(weightController.text),
                                    birthday: birthdayDate!)
                                .whenComplete(() {
                              setState(() {
                                loading = false;
                              });
                            });
                            // Get.to(HomePage());
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _toDMY(DateTime dateTime) {
  return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
}
