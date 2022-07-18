import 'package:flutter/material.dart';

import 'package:my_todo/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../models/auth.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logOut();
            },
            child: AppBigText(text: 'Log Out', color: Colors.red,),));
  }
}
