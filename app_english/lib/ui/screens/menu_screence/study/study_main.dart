import 'package:app_english/ui/screens/menu_screence/study/study_body.dart';
import 'package:app_english/ui/widgets/bottombar/bottombar_widget.dart';
import 'package:flutter/material.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StudyBody(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
