
import 'package:flutter/material.dart';

import 'menu/bottombar.menu.dart';
import 'menu_screence/account_menu.dart';

class Menu_screen extends StatelessWidget {
  const Menu_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Text('HOME')],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
