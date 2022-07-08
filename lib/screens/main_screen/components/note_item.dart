import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';

import '../../../provider/notes.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'custom_dismissible.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      note: note,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(5),
        ),
        padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        width: double.maxFinite,
        height: getProportionateScreenHeight(80),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15 - 5),
            color: AppColors.kSecondaryColor),
        child: Row(
          children: [
            Container(
              width: getProportionateScreenWidth(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius15 - 5),
                    bottomLeft: Radius.circular(Dimensions.radius15 - 5),
                  ),
                  color: note.isHighPrior ? Colors.red : Colors.green),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBigText(
                  text: note.title!,
                ),
                AppSmallText(
                  text: DateFormat.yMd().format(note.date!),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/flame-svgrepo-com.svg',
              width: 30,
              color: note.isHighPrior
                  ? AppColors.kOrangeColor
                  : AppColors.kLightTextColor,
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/edit-button-svgrepo-com.svg',
                width: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
