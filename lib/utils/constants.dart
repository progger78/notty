import 'package:flutter/material.dart';

import 'dimensions.dart';
import 'size_config.dart';

class AppColors {
  static const kPrimaryColor = Color.fromARGB(255, 50, 54, 65);
  static const kSecondaryColor = Color.fromARGB(255, 63, 69, 82);
  static const kOrangeColor = Color(0xFFFF7643);
  static const kLightTextColor = Color.fromARGB(255, 140, 146, 145);
  static const kLightErrorColor = Color.fromARGB(255, 222, 179, 179);

  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );

  static const kTextColor = Color(0xFF757575);
  static const kPurpleColor = Color.fromARGB(255, 81, 0, 220);
  static const klightGreyColor = Color.fromARGB(255, 245, 245, 245);
}

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp passwordValidatorRedExp = RegExp(
    "^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@\$!%*?&])[A-Za-zd@\$!%*?&]{8,}\$");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kLastNamelNullError = "Please Enter your last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// final otpInputDecoration = InputDecoration(
//   contentPadding:
//       EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(Dimensions.height15),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
//     borderSide: const BorderSide(color: AppColors.kTextColor),
//   );
// }

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.kTextColor),
      borderRadius: BorderRadius.circular(Dimensions.radius15));
}
