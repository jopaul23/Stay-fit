import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stayfit/views/constants/constants.dart';

class StepsCount extends StatefulWidget {
  const StepsCount({Key? key}) : super(key: key);

  @override
  State<StepsCount> createState() => _StepsCountState();
}

class _StepsCountState extends State<StepsCount> {
  String _status = 'stopped';
  int _steps = 0;
  final int totalSteps = 1000;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSteps().then((v) => _steps = v);
    initPlatformState();
  }

  Future<int> getSteps() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("step") ?? 0;
  }

  Future<void> saveSteps(int count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("step", count);
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Today's Walk Count",
              style: TextStyle(color: primaryPurple, fontSize: 13),
            ),
            Spacer(),
            Text(_steps.toString())
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 8,
          width: double.infinity,
          child: LinearProgressIndicator(
            value: _steps / totalSteps,
            backgroundColor: ChatPageColors.bgColor,
            valueColor: const AlwaysStoppedAnimation<Color>(primaryPurple),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(_status),
        )
      ],
    );
  }
}
