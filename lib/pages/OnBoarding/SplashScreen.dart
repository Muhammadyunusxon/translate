import 'package:flutter/material.dart';
import 'package:translate/pages/OnBoarding/OnBoardingPage.dart';

// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const OnBoardingPage()), (
          route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/Light.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

        )

    );
  }
}