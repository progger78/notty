import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/utils.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Dimensions.width15,
          top: Dimensions.height15,
          bottom: Dimensions.height5),
      child: SvgPicture.asset(
        svgIcon,
        height: Dimensions.height20,
        color: AppColors.kOrangeColor,
      ),
    );
  }
}