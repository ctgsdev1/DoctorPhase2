import 'package:condition/screens/Welcome_screen.dart';
import 'package:condition/screens/login_screen/login_verification_screen.dart';
import 'package:condition/screens/login_screen/Login_screen.dart';
import 'package:condition/screens/signup_screen/signup_screen.dart';
import 'package:condition/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}
