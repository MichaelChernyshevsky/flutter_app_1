import 'package:flutter/material.dart';

import '../menu/bottombar.menu.dart';

class Study_screen extends StatelessWidget {
  const Study_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('здесь должны быть варианты учебы но... ')),
      bottomNavigationBar: BottomBar(),
    );
  }
}
