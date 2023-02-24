import 'package:app_english/models/app_route.dart';
import 'package:app_english/ui/widgets/bottombar/bottonbar_element.dart';

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var itRoute = ModalRoute.of(context)?.settings.name;

    return Row(
      children: [
        // Home
        ElementBottombar(
          itRoute: itRoute,
          title: "home",
          icon: const Icon(Icons.newspaper),
          color: itRoute == "/home" ? Colors.orange.shade400 : Colors.pink,
          tab: () {
            if (itRoute != '/home') {
              Navigator.of(context).popAndPushNamed(AppRoute.home);
            }
          },
        ),
        // Study
        ElementBottombar(
          itRoute: itRoute,
          title: "study",
          icon: const Icon(Icons.cast_for_education_rounded),
          color: itRoute == "/study" ? Colors.orange.shade400 : Colors.pink,
          tab: () {
            if (itRoute != '/study') {
              Navigator.of(context).popAndPushNamed(AppRoute.study);
            }
          },
        ),

        // Dictionaries
        ElementBottombar(
          itRoute: itRoute,
          title: "dict",
          icon: const Icon(Icons.book_rounded),
          color: itRoute == "/dict" ? Colors.orange.shade400 : Colors.pink,
          tab: () {
            if (itRoute != '/dict') {
              Navigator.of(context).popAndPushNamed(AppRoute.dictionary);
            }
          },
        ),

        // Account
        ElementBottombar(
          itRoute: itRoute,
          title: "account",
          icon: const Icon(Icons.account_box_rounded),
          color: itRoute == "/account" ? Colors.orange.shade400 : Colors.pink,
          tab: () {
            if (itRoute != '/account') {
              Navigator.of(context).popAndPushNamed(AppRoute.account);
            }
          },
        ),
      ],
    );
  }
}
