import 'package:flutter/material.dart';
import 'package:my_todo/utils/size_config.dart';

import 'components/sign_in_body.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SignInBody(),
    );
  }
}