import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key, required this.label, this.maxLines, required this.controller})
      : super(key: key);
  final String label;
  final int? maxLines;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      minLines: 1,
      maxLines: 3,
      style: TextStyle(
          color: Colors.white, fontSize: getProportionateScreenHeight(20)),
      cursorColor: AppColors.kLightTextColor,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(widget.label),
      ),
    );
  }
}
