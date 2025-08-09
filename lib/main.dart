import 'package:calley_app/screens/dashboard_screen.dart';
import 'package:calley_app/screens/graph_screen.dart';
import 'package:calley_app/screens/lang_screen.dart';
import 'package:calley_app/screens/onboarding_screen.dart';
import 'package:calley_app/screens/otp_screen.dart';
import 'package:calley_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calley App',
      debugShowCheckedModeBanner: false,
      // home: GraphScreen(jsonData: null),
      home: OnboardingScreen(),
    );
  }
}
