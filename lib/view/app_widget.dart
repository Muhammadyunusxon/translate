import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/view/pages/initial/splash_screen.dart';

import '../Controller/app_controller.dart';
import '../model/store/local_store.dart';
import 'Style/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  bool isChangeTheme = false;
  bool isLoading = true;

  getTheme() async {
    isLoading = true;
    setState(() {});
    isChangeTheme = await LocalStore.getTheme();
    isLoading = false;
    setState(() {});
  }

  Future<void> change() async {
    isChangeTheme = !isChangeTheme;
    setState(() {});
  }

  @override
  void initState() {
    getTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppController()),
      ],
      child: isLoading
          ? const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Center(child: CircularProgressIndicator()))
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: isChangeTheme ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeStyle.lightTheme,
              darkTheme: ThemeStyle.darkTheme,
              title: 'Translate',
              home: SplashScreen(
                isActive: true,
                isChangeTheme: isChangeTheme,
              ),
            ),
    );
  }
}
