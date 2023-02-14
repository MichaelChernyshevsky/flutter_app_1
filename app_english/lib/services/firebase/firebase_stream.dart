import 'package:app_english/screen/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screen/start/login_screen.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        // слушаем Firebase
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // проверка на пользователя, есть он или нет. Если его нет то мы регистрируемся если есть то мы переходим в само приложение
          if (!snapshot.hasData) {
            return const Login_screen();
          }
          return const Menu_screen();
        });
  }
}
