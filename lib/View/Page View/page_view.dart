import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Data/home_data.dart';
import 'package:urdu_fix/View/Home%20Screen/home_screen.dart';
import 'package:urdu_fix/View/Page%20View/page.dart';
import 'package:urdu_fix/View/Utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreens extends StatelessWidget {
  WelcomeScreens({Key? key}) : super(key: key);
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.015,
              bottom: screenHeight * 0.1,
              right: screenWidth * 0.05,
              left: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () =>
                      Get.offAll(const HomeScreen(), transition: Transition.fadeIn),
                  child: ReusableTxt(
                      txtColor: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                      title: 'skip'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.6,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    for (int i = 0; i < 3; i++)
                      PageOne(
                          imageNum: i,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight)
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const JumpingDotEffect(
                  activeDotColor: themeColor,
                  dotColor: Colors.white70,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
