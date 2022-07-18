import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/auth.dart';
import '../../../provider/notes.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'custom_dismissible.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final note = Provider.of<Note>(context);
    final auth = Provider.of<Auth>(context, listen: false);
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
            Consumer<Note>(
              builder: (context, value, child) => GestureDetector(
                onTap: () {
                  value.markImportant(auth.token!);
                },
                child: SvgPicture.asset(
                  'assets/icons/flame-svgrepo-com.svg',
                  width: 30,
                  color: value.isHighPrior
                      ? AppColors.kOrangeColor
                      : AppColors.kLightTextColor,
                ),
              ),
            ),
            // IconButton(
            //     onPressed: () {
            //       note.markImportant();
            //     },
            //     icon: Icon(
            //         note.isHighPrior ? Icons.favorite : Icons.favorite_border)),
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
