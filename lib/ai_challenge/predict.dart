import 'dart:math';

import 'package:body_detection/models/pose.dart';
import 'package:body_detection/models/pose_landmark_type.dart';
import 'package:body_detection/models/point3d.dart';
import 'package:flutter/foundation.dart';

abstract class Predict extends ValueNotifier {
  Predict(value) : super(value);
  void predict(Pose pose);
}

class HandExcersie extends Predict {
  HandExcersie() : super(null);
  bool handUp = false;
  @override
  void predict(Pose pose) {
    Point3d? leftShoulder,
        rightShoulder,
        rightWrist,
        leftWrist,
        leftElbow,
        rightElbow;
    for (var landmarks in pose.landmarks) {
      if (landmarks.type == PoseLandmarkType.leftShoulder) {
        leftShoulder = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightShoulder) {
        rightShoulder = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightWrist) {
        rightWrist = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.leftWrist) {
        leftWrist = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.leftElbow) {
        leftElbow = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightElbow) {
        rightElbow = landmarks.position;
      }
    }
    if (leftElbow != null && leftWrist != null && leftShoulder != null) {
      final hDiff = (leftShoulder.y - leftElbow.y).abs();
      final xDiff = (leftElbow.x - leftWrist.x).abs();

//hDiff -153.64764404296875 xDiff -89.208740234375 yDiff 284.9253845214844
      if (!handUp) {
        if (leftElbow.y + 40 < leftShoulder.y &&
            leftElbow.y > leftWrist.y &&
            xDiff < 50) {
          handUp = true;
        }
      }
      if (handUp) {
        if (leftElbow.y > leftShoulder.y &&
            leftElbow.y < leftWrist.y &&
            xDiff < 50) {
          handUp = false;
          notifyListeners();
        }
      }
    }
  }
}

class BendExcersie extends Predict {
  BendExcersie() : super("");
  bool isUp = true;
  @override
  void predict(Pose pose) {
    Point3d? sl, sr, al, ar, el, er;
    for (var landmarks in pose.landmarks) {
      if (landmarks.type == PoseLandmarkType.leftShoulder) {
        sl = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightShoulder) {
        sr = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightWrist) {
        ar = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.leftWrist) {
        al = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.leftElbow) {
        el = landmarks.position;
      } else if (landmarks.type == PoseLandmarkType.rightElbow) {
        er = landmarks.position;
      }
    }
    // final radians1 = leftShoulder!.y - leftElbow!.y;
    // final radians2 = leftShoulder.x - leftElbow.x;
    // final radians3 = leftWrist!.y - leftElbow.y;
    // final radians4 = leftWrist.x - leftElbow.x;

    // final radians5 = rightShoulder!.y - rightElbow!.y;
    // final radians6 = rightShoulder.x - rightElbow.x;
    // final radians7 = rightWrist!.y - rightElbow.y;
    // final radians8 = rightWrist.x - rightElbow.x;

    // final radians9 = radians2 - radians4;
    // final radians10 = radians1 - radians3;

    // final radians11 = radians6 - radians8;
    // final radians12 = radians5 - radians7;

    // final r = atan2(radians5, radians6);
    // final r2 = atan2(radians11, radians12);
    final oneAng = atan2(ar!.y - er!.y, ar.x - er.x) * 180 / pi;
    final twoAng = atan2(er.y - sr!.y, er.x - sr.x) * 180 / pi;
    final threeAng = atan2(el!.y - sl!.y, el.x - sl.x) * 180 / pi;
    final fourAng = atan2(al!.y - el.y, al.x - el.x) * 180;

    // String step = "none";
    // double langle = r * 180 / pi;
    // double rangle = r2 * 180 / pi;
    // langle = langle.abs();
    // print(langle);

    double langle = 180 + twoAng - oneAng;
    double rangle = 180 + fourAng - threeAng;

    if (langle > 180) {
      langle = 360 - langle;
    }

    if (rangle > 180) {
      rangle = 360 - rangle + 90;
    }

    print("Left $langle");
    print("Right $rangle");
    if (langle < 100 && rangle < 100) {
      if (isUp) {
        notifyListeners();
      }
      isUp = false;
    }
    if (langle > 100 && rangle > 100) {
      isUp = true;
    }

    // if (rightShoulder?.y != null &&
    //     leftShoulder!.y >= rightElbow!.y &&
    //     leftElbow?.y != null) {
    //   step = "up";
    // }

    // if (rightShoulder?.y != null &&
    //     leftShoulder!.y <= rightElbow!.y &&
    //     leftElbow?.y != null &&
    //     step == "up") {
    //   step = "down";
    //   notifyListeners();
  }
}
