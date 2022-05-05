import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/home.dart';
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
  DateTime? birthdayDate;
  String birthdayString = "";
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
                  "asset/svg/workout-svg.svg",
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
                        children: [
                          Expanded(
                            child: TextFieldCustom(
                              keyboardType: TextInputType.number,
                              hintText: "height(in cm)",
                              textEditingController: heightController,
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding * 2,
                          ),
                          Expanded(
                            child: TextFieldCustom(
                              keyboardType: TextInputType.number,
                              hintText: "weight(in kg)",
                              textEditingController: weightController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      DropDownCustom(
                          items: ["male", "female", "other"],
                          dropdownChanged: (value) {},
                          text: "gender"),
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
                          text: "Continue",
                          onpressed: () {
                            Get.to(HomePage());
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
