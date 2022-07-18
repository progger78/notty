import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class CustomErrors extends StatelessWidget {
  const CustomErrors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => Row(
          children: [
            SvgPicture.asset('assets/icons/Error.svg'),
            SizedBox(width: getProportionateScreenHeight(10)),
            Padding(
              padding: EdgeInsets.only(bottom: getProportionateScreenHeight(5)),
              child: AppSmallText(
                text: errors[index],
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
