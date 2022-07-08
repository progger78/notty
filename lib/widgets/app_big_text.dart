import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class AppBigText extends StatelessWidget {
  AppBigText(
      {Key? key,
      required this.text,
      this.color,
      this.size,
      this.fontWeight,
   
      this.textAlign})
      : super(key: key);

  final String text;
  Color? color;
  double? size;

  final TextAlign? textAlign;

  dynamic fontWeight;

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Text(
      
      
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
      
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: size ?? Dimensions.font22,
          color: color ?? Colors.white),
    );
  }
}
