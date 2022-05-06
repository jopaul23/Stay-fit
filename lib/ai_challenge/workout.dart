import 'package:body_detection/body_detection.dart';
import 'package:body_detection/models/image_result.dart';
import 'package:body_detection/models/pose.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stayfit/views/constants/constants.dart';

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
  RxInt myCount = 0.obs;
  late BendExcersie handExcersie;
  bool connected = false;
  int totalSec = 30, currentSec = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  void dispose() {
    release();
    super.dispose();
  }

  void release() async {
    await BodyDetection.disablePoseDetection();
    await BodyDetection.stopCameraStream();
  }

  void _init() async {
    bool result = await checkPermission();
    if (result) {
      handExcersie = BendExcersie();
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
        myCount.value++;
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
          body: Stack(
        alignment: Alignment.center,
        children: [
          _cameraImage ?? const CircularProgressIndicator(),
          Positioned(
              top: 50,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Your Count",
                        style: TextStyle(
                            color: primaryPurple,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(myCount.toString(),
                          style: TextStyle(
                              color: primaryPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              )),
          Positioned(
            bottom: 90,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularCountDownTimer(
                  width: 70,
                  height: 70,
                  duration: totalSec,
                  fillColor: primaryPurple,
                  ringColor: Colors.grey[300]!,
                  onComplete: onComplete,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  void onComplete() async {
    await BodyDetection.enablePoseDetection();
    await BodyDetection.startCameraStream();

    //send count to server
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
