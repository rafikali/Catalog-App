import 'package:flutter/material.dart';
import 'package:helloworld/utiils/routes.dart';
import 'package:helloworld/widgets/theme.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: MyTheme.lighttheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark
        ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
      "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
  },
    );
  }
}