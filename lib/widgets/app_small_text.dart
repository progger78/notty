import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

class AppSmallText extends StatelessWidget {
  const AppSmallText({
    Key? key,
    required this.text,
    this.color = AppColors.kLightTextColor,
    this.size,
    this.height = 1.6,
    this.textAlign,
    this.textDecoration,
    this.fontWeight,
    this.maxLines,
    this.textOverflow,
  }) : super(key: key);

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? size;
  final double height;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: GoogleFonts.lato(
          decoration: textDecoration,
          fontSize: size ?? Dimensions.font16,
          color: color,
          height: height,
          fontWeight: fontWeight),
      maxLines: maxLines,
    );
  }
}
