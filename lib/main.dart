import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo/screens/home_screen/home_screen.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '/screens/sign_in_screen/sign_in_screen.dart';
import '/widgets/splash_screen.dart';
import '/models/auth.dart';
import '/provider/notes.dart';
import '/screens/main_screen/main_screen.dart';
import '/theme.dart';

import 'routes/route_helper.dart';

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
          create: (contex) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Notes>(
          update: (context, value, previous) => Notes(
              previous == null ? [] : previous.notes,
              value.token ?? '',
              value.userId),
          create: (contex) => Notes([], '', ''),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          home: auth.isAuth
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogIn(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const SignIn()),
          getPages: RouteHelper.pages,
        ),
      ),
    );
  }
}
