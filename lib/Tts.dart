import 'package:flutter_tts/flutter_tts.dart';

// void initialize() {
//     flutterTts.setStartHandler(() {
//       setState(() {
//         isSpeaking = true;
//       });
//     });
//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         isSpeaking = false;
//       });
//     });
//     flutterTts.setErrorHandler((message) {
//       setState(() {
//         isSpeaking = false;
//       });
//     });
//   }
 FlutterTts flutterTts = FlutterTts();

speak(String str) async {
 
  await flutterTts.setLanguage('en-US');
  await flutterTts.setPitch(1);
  await flutterTts.setSpeechRate(0.4);
  if (str != Null) {
    flutterTts.speak(str);
  }
}

// Future stop() async {
//   flutterTts.stop();
//   setState(() {
//     isSpeaking = false;
//   });
// }
