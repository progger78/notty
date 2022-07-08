
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.width,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final double? width;

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return SizedBox(
      width: width ?? double.maxFinite,
      height: getProportionateScreenHeight(60),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius20)),
          color: AppColors.kOrangeColor,
          onPressed: press,
          child: AppBigText(
            text: text,
            fontWeight: FontWeight.w500,
            size: getProportionateScreenHeight(20),
            color: Colors.white,
          )),
    );
  }
}
