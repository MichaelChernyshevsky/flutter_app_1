// Screense
import 'package:app_english/screen/menu.dart';
import 'package:app_english/screen/menu_screence/account_menu.dart';
import 'package:app_english/screen/menu_screence/dict_main.dart';
import 'package:app_english/screen/menu_screence/home_menu.dart';
import 'package:app_english/screen/menu_screence/study_main.dart';
import 'package:app_english/screen/start/login_screen.dart';
import 'package:app_english/screen/start/reg_screen.dart';
import 'package:app_english/services/firebase/firebase_stream.dart';
import 'models/app_route.dart';
// Database
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'services/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //подключение Firebase
  final _ = await Firebase.initializeApp(
    name: 'KnLang',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // подключене Hive
  await Hive.initFlutter();
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          canvasColor:
              CupertinoColors.secondarySystemBackground.highContrastColor),
      // наши файлы и страницы
      routes: {
        // файл FirebaseStream в котором мы проверяем пользователя
        AppRoute.initial: (_) => const FirebaseStream(),
        // экран регистрации Firebaseregistration
        AppRoute.registration: (_) => const Registration_screen(),
        // экран входа Firebaseauth
        AppRoute.login: (_) => const Login_screen(),
        // экран меню
        AppRoute.menu: (context) => const Menu_screen(),
        // экран оснвной
        AppRoute.home: (context) => const Home_screen(),
        // экран учебы
        AppRoute.study: (context) => const Study_screen(),
        // экран словрей
        AppRoute.dictionary: (context) => const Study_screen(),
        // экран аккаунта
        AppRoute.account: (_) => const Account_screen(),
      },
      initialRoute: AppRoute.initial,
    );
  }
}
