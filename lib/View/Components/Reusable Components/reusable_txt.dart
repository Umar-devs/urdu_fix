import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTxt extends StatelessWidget {
  const ReusableTxt(
      {Key? key,
      required this.txtColor,
      required this.fontWeight,
      required this.fontSize,
      required this.title,  this.txtAlign=TextAlign.start})
      : super(key: key);
  final String title;
  final double fontSize;
  final Color txtColor;
  final TextAlign txtAlign;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:txtAlign,
      title,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: txtColor,
        decoration: TextDecoration.none
      ),
    );
  }
}
