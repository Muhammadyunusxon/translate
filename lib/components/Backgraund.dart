import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/SettingsPage.dart';

import '../Controller/AppController.dart';
import '../main.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Container(
        width: double.infinity,
        height:  double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/${context.watch<AppController>().isChangeTheme ? "Dark" : "Light"}.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    SizedBox(
                        height: 18,
                        child: Image.asset(
                          "assets/images/logo${context.watch<AppController>().isChangeTheme ? "Dark" : ""}.png",
                        )),
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                      splashRadius: 28,
                      icon: SizedBox(
                        height: 22,
                        child: Image.asset(
                            "assets/icon/Theme${context.watch<AppController>().isChangeTheme ? "Dark" : "Light"}.png"),
                      ),
                      onPressed: () {
                        context.read<AppController>().changeTheme();
                        MyApp.of(context)!.change();
                      },
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      splashRadius: 28,
                      icon: Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SettingPage()));
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
