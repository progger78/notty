import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    Key? key,
    required this.press,
    required this.selectedDate,
  }) : super(key: key);

  final GestureTapCallback press;
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
 
    return GestureDetector(

      onTap: press,
      child: Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        margin: EdgeInsets.only(top: getProportionateScreenHeight(5)),
        width: double.maxFinite,
        height: getProportionateScreenHeight(120),
        decoration: BoxDecoration(
          color: AppColors.kSecondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/calendar-svgrepo-com.svg',
              width: getProportionateScreenWidth(85),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBigText(text: 'Selected Date'),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  AppBigText(text: selectedDate)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}