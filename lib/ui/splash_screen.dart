import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/splash.png"))),
      ),
    );
  }
}
