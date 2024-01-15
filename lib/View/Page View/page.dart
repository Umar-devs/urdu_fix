import 'package:flutter/material.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Utils/constants.dart';

import '../Data/home_data.dart';

class PageOne extends StatelessWidget {
  const PageOne(
      {Key? key,
      required this.imageNum,
      required this.screenWidth,
      required this.screenHeight})
      : super(key: key);
  final int imageNum;
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height:screenHeight*0.4,child: Image.asset(images[imageNum])),
        ReusableTxt(
            txtColor: themeColor,
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.035,
            title: pageViewTxt[imageNum])
      ],
    );
  }
}
