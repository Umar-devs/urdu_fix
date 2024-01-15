import 'package:flutter/material.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Data/urdu_data.dart';
import 'package:urdu_fix/View/Utils/constants.dart';

class AlphabetBox extends StatelessWidget {
  const AlphabetBox({Key? key,required this.screenWidth,required this.screenHeight}) : super(key: key);
final double screenHeight;
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return     GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 boxes in a row
      ),
      itemCount: urduAlphabets.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Container(
            height: screenHeight * 0.08,
            width: screenWidth * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: backgroundColor,
                  offset: const Offset(-1, -1),
                  spreadRadius: 2,
                  blurRadius: 4,
                )
              ],
            ),
            child: Center(
              child: Text(
                urduAlphabets[index],
                style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
