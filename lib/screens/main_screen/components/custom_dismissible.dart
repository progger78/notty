import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../provider/notes.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class CustomDismissible extends StatelessWidget {
  const CustomDismissible({Key? key, required this.note, required this.child})
      : super(key: key);
  final Note note;
  final Widget child;
  @override
  Widget build(BuildContext context) {
  
    return Dismissible(
      key: ValueKey(note.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: getProportionateScreenWidth(25)),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(5),
        ),
        height: getProportionateScreenHeight(80),
        decoration: BoxDecoration(
          color: AppColors.kLightErrorColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius10),
            bottomRight: Radius.circular(Dimensions.radius10),
          ),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            'assets/icons/Trash.svg',
            width: getProportionateScreenHeight(25),
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Notes>(context, listen: false).deleteItem(note.id!);
      },
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (ctx) {
          return CustomAlertDialog(
              title: 'Are you sure?',
              context: ctx,
              content: 'Are you sure you want to delete?');
        },
      ),
      child: child,
    );
  }
}
