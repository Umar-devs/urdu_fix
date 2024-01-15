import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Data/urdu_data.dart';
import 'package:urdu_fix/View/Utils/constants.dart';
import 'package:get/get.dart';

class WordsSentences extends StatelessWidget {
   WordsSentences({Key? key}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: ReusableTxt(
            txtColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.05,
            title: 'Words & Sentences'),
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
        child: ListView.builder(
            itemCount: wordsSentences.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
               onTap: (){
                 processText(translations[index]);
               },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 7, horizontal: screenWidth * 0.025),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth*0.025),
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableTxt(
                              txtColor: themeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.035,
                              title: wordsSentences[index]),
                          ReusableTxt(
                              txtColor: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.035,
                              title: translations[index]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Icon(Icons.volume_up,size: screenWidth*0.05,),
                          ReusableTxt(
                              txtColor: themeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.035,
                              title: romanTranslation[index]),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
