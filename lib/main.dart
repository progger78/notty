import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo/provider/notes.dart';
import 'package:my_todo/routes/route_helper.dart';
import 'package:my_todo/theme.dart';
import 'package:my_todo/utils/utils.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(
          create: (contex) => Notes(),
        )
      ],
      child: GetMaterialApp(
        
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          initialRoute: RouteHelper.initialScreen,
          getPages: RouteHelper.pages,),
          
    );
    
  }
  
}
