import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'app_big_text.dart';
import 'app_small_text.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    Key? key,
    required this.context,
    required this.content,
    this.title,
    this.twoButtons = true,
  }) : super(key: key);

  final BuildContext context;

  final String content;
  final String? title;
  bool twoButtons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kSecondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius25)),
      title: Text(
        title ?? 'Something went wrong',
        style: TextStyle(color: Colors.white),
      ),
      content: AppBigText(
        text: content,
        color: Colors.white,
      ),
      actions: [
        twoButtons
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildFlatButton(
                      context: context,
                      text: 'Yes',
                      color: Colors.red,
                      press: () {
                        Navigator.of(context).pop(true);
                      }),
                  buildFlatButton(
                    context: context,
                    text: 'No',
                    color: Colors.white,
                    press: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            : buildFlatButton(
                context: context,
                text: 'Okay',
                color: Colors.red,
                press: () {
                  Navigator.of(context).pop();
                },
              ),
      ],
    );
  }

  FlatButton buildFlatButton({context, text, color, press}) {
    return FlatButton(
      onPressed: press,
      child: AppSmallText(
        text: text,
        color: color,
        size: Dimensions.font22,
      ),
    );
  }
}
