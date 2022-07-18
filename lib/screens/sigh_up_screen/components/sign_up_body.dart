import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo/routes/route_helper.dart';
import 'package:my_todo/screens/sigh_up_screen/components/sign_up_form_fields.dart';

import '../../../utils/utils.dart';
import '../../../widgets/sign_up_in_line.dart';
import '../../../widgets/widgets.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBigText(
          text: 'Sign up',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          size: getProportionateScreenHeight(30),
        ),
        const SignUpFormFields(),
        SignInUpLine(
            text: 'Already registered?',
            buttonText: 'Sign In',
            press: () {
              print('press');
              Get.toNamed(RouteHelper.signInScreen);
            }),
      ],
    );
  }
}
