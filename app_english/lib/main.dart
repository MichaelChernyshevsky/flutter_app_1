// Screense

import 'package:app_english/blocs/block_exports.dart';
import 'package:app_english/blocs/dict/dict_bloc.dart';
import 'package:app_english/blocs/dict/dict_event.dart';
import 'package:app_english/models/dictionaryes/dictionary.dart';
import 'package:app_english/models/dictionaryes/word.dart';
import 'package:app_english/provider/user.provider.dart';
import 'package:app_english/ui/screens/menu.dart';
import 'package:app_english/ui/screens/menu_screence/account/account_menu.dart';
import 'package:app_english/ui/screens/menu_screence/dictionari/dict_main.dart';
import 'package:app_english/ui/screens/menu_screence/home_menu.dart';
import 'package:app_english/ui/screens/menu_screence/study/card_choice.dart';
import 'package:app_english/ui/screens/menu_screence/study/study_main.dart';
import 'package:app_english/ui/screens/start/login_screen.dart';
import 'package:app_english/ui/screens/start/reg_screen.dart';
import 'package:app_english/ui/screens/start/splash_screen.dart';
import 'package:provider/provider.dart';
import 'models/app_route.dart';
// Database
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _ = await Firebase.initializeApp(
    name: 'KnLang',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DictsBloc>(
          create: (BuildContext context) => DictsBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.addListener(() {
      if (!userProvider.isExists) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoute.login, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DictsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 102, 9, 88),
            appBarTheme: const AppBarTheme(color: Colors.pink)),
        routes: {
          AppRoute.initial: (_) => const SplashScreen(),
          AppRoute.registration: (_) => const RegistrationScreen(),
          AppRoute.login: (_) => const LoginScreen(),
          AppRoute.menu: (context) => const MenuScreen(),
          AppRoute.home: (context) => const HomeScreen(),
          AppRoute.study: (context) => const StudyScreen(),
          AppRoute.dictionary: (context) => const DictionariesScreen(),
          AppRoute.account: (_) => const AccountScreen(),
          AppRoute.card_dicts: (_) => const CardDicts(),
        },
        initialRoute: AppRoute.initial,
      ),
    );
  }
}
