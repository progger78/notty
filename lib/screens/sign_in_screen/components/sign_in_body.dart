import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_todo/routes/route_helper.dart';

import 'package:my_todo/screens/sign_in_screen/components/sign_in_form_fields.dart';
import 'package:my_todo/utils/utils.dart';
import 'package:my_todo/widgets/widgets.dart';

import '../../../widgets/sign_up_in_line.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBigText(
          text: 'Sign in',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          size: getProportionateScreenHeight(30),
        ),
        const SignInFormFields(),
        SignInUpLine(
            text: 'Don\'t have an account?',
            buttonText: 'Sign Up',
            press: () => Get.toNamed(RouteHelper.signUpScreen)),
      ],
    );
  }
}

