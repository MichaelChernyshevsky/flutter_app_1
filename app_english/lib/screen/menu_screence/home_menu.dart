import 'package:flutter/material.dart';

import '../menu/bottombar.menu.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('здесь должно быть что то ')),
      bottomNavigationBar: BottomBar(),
    );
  }
}
