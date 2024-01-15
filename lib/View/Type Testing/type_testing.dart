import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Utils/constants.dart';

class TypeTestingScreen extends StatelessWidget {
  TypeTestingScreen({
    Key? key,
  }) : super(key: key);
  final controller = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();
  Future<void> speakUrdu(String text) async {
    await flutterTts.setLanguage('ur-PK');
    await flutterTts.setSpeechRate(0.3); // Adjust the speech rate here if needed
    await flutterTts.setPitch(1.13); // Adjust the pitch here if needed
    await flutterTts.speak(text);
  }

  bool isUrdu(String text) {
    // Simple check for Urdu text (you might need a more robust method)
    // This is a basic example, you might want to use a better validation technique
    // based on your specific use case
    RegExp urduRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    return urduRegex.hasMatch(text);
  }

  void processText(String text) {
    if (isUrdu(text)) {
      speakUrdu(text);
    } else {
      if (kDebugMode) {
        print('The text is not in Urdu.');
      }
      // Handle or display a message for non-Urdu text here
    }
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: ColoredBox(
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              margin: EdgeInsets.only(
                  top: screenHeight * 0.1,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      color: Colors.grey.shade200,
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ]),
              child: Material(
                  child: TextField(
                textAlign: TextAlign.right,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    hintText: 'یہاں لکھیں',
                    hintStyle: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade400)),
              )),
            ),
            GestureDetector(
              onTap: () {
                processText(controller.text);
              },
              child: Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.6,
                margin: EdgeInsets.only(top: screenHeight * 0.05),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: ReusableTxt(
                      txtColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                      title: 'Tap to Listen'),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
