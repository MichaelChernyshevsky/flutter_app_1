import 'package:app_english/models/app_route.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var itRoute = ModalRoute.of(context)?.settings.name;

    return Row(
      children: [
        // Home
        Material(
          color: itRoute == '/home'
              ? Colors.orange.shade400
              : Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              if (itRoute != '/home') {
                Navigator.of(context).popAndPushNamed(AppRoute.home);
              }
            },
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(Icons.newspaper),
              ),
            ),
          ),
        ),
        // Study
        Material(
          color: itRoute == '/study'
              ? Colors.orange.shade400
              : Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              if (itRoute != '/study') {
                Navigator.of(context).popAndPushNamed(AppRoute.study);
              }
            },
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(Icons.cast_for_education_rounded),
              ),
            ),
          ),
        ),
        // Dictionaries
        Material(
          color: itRoute == '/dict'
              ? Colors.orange.shade400
              : Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              if (itRoute != '/dict') {
                Navigator.of(context).popAndPushNamed(AppRoute.dictionary);
              }
            },
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(Icons.book_rounded),
              ),
            ),
          ),
        ),
        // Account
        Material(
          color: itRoute == '/account'
              ? Colors.orange.shade400
              : Colors.grey.shade400,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
          child: InkWell(
            onTap: () {
              if (itRoute != '/account') {
                Navigator.of(context).popAndPushNamed(AppRoute.account);
              }
            },
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(Icons.account_box_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
