import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class SignInUpLine extends StatelessWidget {
  const SignInUpLine({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.press,
  }) : super(key: key);

  final String text, buttonText;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSmallText(
          text: text,
          color: Colors.white,
          size: getProportionateScreenHeight(17),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        GestureDetector(
          onTap: press,
          child: AppSmallText(
              text: buttonText,
              color: AppColors.kOrangeColor,
              size: getProportionateScreenHeight(17)),
        )
      ],
    );
  }
}
