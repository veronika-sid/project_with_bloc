
import 'package:flutter/material.dart';
import 'package:project_with_bloc/pages/login/login_page.dart';
import 'package:project_with_bloc/pages/main/main_page.dart';
import 'package:project_with_bloc/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sarabun'),
      routes: {
        '/loginPage': (context) => const LoginPage(),
        '/mainPage': (context) => const MainPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashPage(nextRoute: '/loginPage',),
    );
  }
}