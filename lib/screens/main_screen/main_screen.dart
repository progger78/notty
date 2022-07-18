import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:my_todo/routes/route_helper.dart';
import 'package:my_todo/utils/size_config.dart';

import 'components/main_screen_body.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(23),
              top: getProportionateScreenHeight(5)),
          child: IconButton(
            onPressed: () {}, // TODO add some functionality,

            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: getProportionateScreenHeight(30),
            ),
          ),
        ),
        title: const Text('Notty'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(23)),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.addNoteScreen);
              },
              child: SvgPicture.asset(
                'assets/icons/add-button-2.svg',
                width: getProportionateScreenWidth(25),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
     
      body: const MainScreenBody(),
    );
  }
}
