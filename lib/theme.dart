import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/utils.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecoration(),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.kOrangeColor,
      secondary: AppColors.kSecondaryColor,
    ),
    timePickerTheme: timePickerDecoration(),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.kOrangeColor,
        textStyle: const TextStyle(color: AppColors.kOrangeColor),
      ),
    ),
  );
}

TimePickerThemeData timePickerDecoration() {
  return const TimePickerThemeData(
    
      backgroundColor: AppColors.kSecondaryColor,
      hourMinuteTextColor: Colors.white,
      hourMinuteColor: AppColors.kSecondaryColor,
      // dayPeriodTextColor: AppColors.kOrangeColor,
      entryModeIconColor: AppColors.kOrangeColor,
      helpTextStyle: TextStyle(color: AppColors.kOrangeColor),
      inputDecorationTheme: InputDecorationTheme()

      //  dialTextColor: Colors.white
      );
}

InputDecorationTheme inputDecoration() {
  UnderlineInputBorder underlineInputBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.kOrangeColor),
  );
  return InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.white, fontSize: 25),
      hintStyle: const TextStyle(color: AppColors.kLightTextColor),
      enabledBorder: underlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.white)),
      focusedBorder: underlineInputBorder,
      border: underlineInputBorder);
}

//   InputDecorationTheme(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       enabledBorder: outlineInputBorder,
//       focusedBorder: outlineInputBorder.copyWith(
//           borderSide: const BorderSide(color: AppColors.klightGreyColor)),
//       border: outlineInputBorder,
//       errorBorder: outlineInputBorder.copyWith(
//           borderSide: const BorderSide(color: Colors.red, width: 1.5)),
//       focusedErrorBorder: outlineInputBorder.copyWith(
//           borderSide: const BorderSide(color: AppColors.klightGreyColor)));
// }

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: AppColors.kTextColor),
      bodyText2: TextStyle(color: AppColors.kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColors.kPrimaryColor,
      toolbarTextStyle: const TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20),
      ).bodyText2,
      titleTextStyle: const TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20),
      ).headline6);
}
