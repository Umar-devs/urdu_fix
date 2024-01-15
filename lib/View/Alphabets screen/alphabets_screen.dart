import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Data/urdu_data.dart';
import 'package:urdu_fix/View/Utils/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlphabetsScreen extends StatefulWidget {
  const AlphabetsScreen({Key? key}) : super(key: key);

  @override
  State<AlphabetsScreen> createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  final FlutterTts flutterTts = FlutterTts();
  Future<void> speakUrdu(String text) async {
    await flutterTts.setLanguage('ur-PK');
    await flutterTts.setSpeechRate(0.25); // Adjust the speech rate here if needed
    await flutterTts.setPitch(1.2); // Adjust the pitch here if needed
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: ReusableTxt(
            txtColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.05,
            title: 'Learn Alphabets'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: ColoredBox(
            color: backgroundColor,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 boxes in a row
              ),
              itemCount: urduAlphabets.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: GestureDetector(
                    onTap: (){
                      processText(urduAlphabets[index]);
                    },
                    child: Container(
                        height: screenHeight * 0.088,
                        width: screenWidth * 0.21,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              offset: const Offset(1, 1),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                            const BoxShadow(
                              color: backgroundColor,
                              offset: Offset(-1, -1),
                              spreadRadius: 2,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                urduWord[index],
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: themeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.025,
                                ),
                              ),
                            ),
                            Text(
                              urduAlphabets[index],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth * 0.05,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                romanUrduWords[index],
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: themeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.025,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
