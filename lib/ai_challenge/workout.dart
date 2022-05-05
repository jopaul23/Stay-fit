import 'package:body_detection/body_detection.dart';
import 'package:body_detection/models/image_result.dart';
import 'package:body_detection/models/pose.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controller.dart';
import 'predict.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Widget? _cameraImage;
  Size? _imageSize;
  Pose? pose;
  late HandExcersie handExcersie;
  late ChallengeController challengeController;
  bool connected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    challengeController = Get.find<ChallengeController>();
    challengeController.connect().then((value) {
      setState(() {
        connected = value;
      });
      if (value) {
        _init();
      }
    });
  }

  void _init() async {
    bool result = await checkPermission();
    if (result) {
      handExcersie = HandExcersie();
      await BodyDetection.enablePoseDetection();
      await BodyDetection.startCameraStream(
        onFrameAvailable: (ImageResult image) {
          _handleCameraImage(image);
        },
        onPoseAvailable: (Pose? p) {
          if (p != null) {
            handExcersie.predict(p);
          }
        },
      );
      handExcersie.addListener(() {
        if (challengeController.myCount > 1000) {
          challengeController.myCount = 0;
        }
        challengeController.myCount++;
        challengeController.sendData(challengeController.myCount);
        challengeController.update(["my_count"]);
      });
    } else {
      debugPrint("Camera access denied");
    }
  }

  Future<bool> checkPermission() async {
    var status = await Permission.camera.status;
    while (status.isDenied) {
      status = await Permission.contacts.request();
      if (status.isPermanentlyDenied) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () async {
        //   if (!_start) {
        //     await BodyDetection.enablePoseDetection();
        //     await BodyDetection.startCameraStream(
        //       onFrameAvailable: (ImageResult image) {
        //         _handleCameraImage(image);
        //       },
        //       onPoseAvailable: (Pose? p) {
        //         if (p != null) {
        //           setState(() {
        //             pose = p;
        //           });
        //           handExcersie.predict(p);
        //         }
        //       },
        //       onMaskAvailable: (_) {},
        //     );
        //   } else {
        //     await BodyDetection.disablePoseDetection();
        //     await BodyDetection.stopCameraStream();
        //   }

        //   _start = !_start;
        // }),
        body: !connected
            ? const CircularProgressIndicator()
            : Stack(
                alignment: Alignment.center,
                children: [
                  _cameraImage ?? Offstage(),
                  pose != null
                      ? CustomPaint(
                          size: MediaQuery.of(context).size,
                          //  painter: PosePainter(pose: pose!, imageSize: _imageSize!),
                        )
                      : Offstage(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<ChallengeController>(
                            id: "my_count",
                            builder: (_) {
                              return Column(
                                children: [
                                  const Text(
                                    "Naigal",
                                    style: TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    challengeController.myCount.toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "VS",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        GetBuilder<ChallengeController>(
                            id: "user_count",
                            builder: (controller) {
                              return Column(
                                children: [
                                  const Text(
                                    "Pranav",
                                    style: TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.userCount.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF00346b),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  void _handleCameraImage(ImageResult result) {
    // Ignore callback if navigated out of the page.
    if (!mounted) return;

    // To avoid a memory leak issue.
    // https://github.com/flutter/flutter/issues/60160
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();

    final image = Image.memory(
      result.bytes,
      gaplessPlayback: true,
      height: Get.height,
      width: Get.width,
      fit: BoxFit.fill,
    );

    setState(() {
      _cameraImage = image;
      _imageSize = result.size;
    });
  }
}
