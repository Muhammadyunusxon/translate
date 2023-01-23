import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/SettingsPage.dart';

import '../Controller/AppController.dart';
import '../main.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool isBack;

  const Background({Key? key, required this.child, this.isBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
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
                  isBack
                      ? const Spacer(
                          flex: 2,
                        )
                      : const SizedBox.shrink(),
                  isBack
                      ? IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).secondaryHeaderColor,
                          ))
                      : const SizedBox.shrink(),
                  isBack
                      ? const Spacer(
                          flex: 6,
                        )
                      : const SizedBox.shrink(),
                  !isBack
                      ? const Spacer(
                          flex: 9,
                        )
                      : const SizedBox.shrink(),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const SettingPage()));
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
    );
  }
}
