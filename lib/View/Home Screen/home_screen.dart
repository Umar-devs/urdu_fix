import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urdu_fix/View/Components/Reusable%20Components/reusable_txt.dart';
import 'package:urdu_fix/View/Data/home_data.dart';
import 'package:urdu_fix/View/Utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        backgroundColor: themeColor,
        title: ReusableTxt(
            txtColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.05,
            title: 'Urdu Fix'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ColoredBox(
                    color: backgroundColor,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          const ReusableTxt(
                              txtColor: themeColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                              title: 'Logo'),
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.07),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: ReusableTxt(
                                  txtColor: themeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  title: 'Open Page'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.025,
                                right: screenWidth * 0.025,
                                top: screenHeight * 0.04),
                            child: SizedBox(
                              height: screenHeight * 0.22,
                              width: screenWidth,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Get.to(screens[index],transition: Transition.fadeIn);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.symmetric(vertical: 10),
                                        width: screenWidth * 0.37,
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
                                              const BoxShadow(
                                                color: backgroundColor,
                                                offset: Offset(-1, -1),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                              )
                                            ]),
                                        child: Center(
                                          child: ReusableTxt(
                                              txtColor: themeColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: screenWidth * 0.05,
                                              title: pages[index]),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemCount: pages.length),
                            ),
                          ),

                        ],
                      ),
                    ),
                  )), Positioned(
                bottom: screenHeight*0.15,
                left: screenWidth*0.15,
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: ReusableTxt(
                        txtColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                        title: 'About App'),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
