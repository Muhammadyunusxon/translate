import 'package:flutter/material.dart';
import 'package:translate/pages/CustomPage.dart';
import 'package:translate/pages/FavouritesPage.dart';
import 'package:translate/pages/HomePage.dart';
import 'package:translate/pages/OnBoarding/SplashScreen.dart';

import 'Style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeStyle.lightTheme!,
      darkTheme:ThemeStyle.darkTheme!,
      home:  SplashScreen(),
    );
  }
}