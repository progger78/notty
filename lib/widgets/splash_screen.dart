import 'package:flutter/material.dart';
import 'package:my_todo/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.kOrangeColor,
        ),
      ),
    );
  }
}
