import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  // Splash Screen waits for 5000 milli sec
  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/HomePage');
  }

  @override
  void initState() {
    super.initState();
    startTime();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FadeTransition(
        opacity: animation,
        child: Image.asset(
          'assets/images/infigon.png',
          width: 200,
          height: 70,
        ),
      )),
    );
  }
}
