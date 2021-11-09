import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    run();
  }

  void run() {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.off(() => LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/splash.gif'),
        ));
  }
}
