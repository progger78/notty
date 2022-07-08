import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ContainerWithTime extends StatelessWidget {
  const ContainerWithTime({
    Key? key,
    required this.title,
    required this.press,
    required this.svgIcon,
    required this.selectedTime,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final String svgIcon;
  final String selectedTime;

  @override
  Widget build(BuildContext context) {
 
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
        width: getProportionateScreenWidth(164),
        height: getProportionateScreenHeight(120),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: AppColors.kSecondaryColor),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: AppColors.kOrangeColor,
              width: getProportionateScreenWidth(50),
            ),
            SizedBox(width: getProportionateScreenWidth(5)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSmallText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                AppSmallText(
                  text: selectedTime.toString(),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
