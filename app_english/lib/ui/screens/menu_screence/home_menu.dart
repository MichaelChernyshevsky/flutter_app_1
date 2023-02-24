import 'package:app_english/ui/widgets/bottombar/bottombar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('здесь должно быть что то ')),
      bottomNavigationBar: BottomBar(),
    );
  }
}
