import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../screen/menu.dart';
import '../screen/start/login_screen.dart';
import '../services/firebase/notification.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }
  User? user;
  bool isExists = false;

  String? userMail;

  Future<bool> get isLoggedIn async => user != null;

  Future<Widget> init() async {
    user = FirebaseAuth.instance.currentUser;
    userMail = user?.email;
    if (user != null) {
      isExists = !isExists;
      return const Login_screen();
    }
      return const Menu_screen();
  }

  Future<User?> login(
    context,
    String email,
    String password,
  ) async {
    try {
      user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        NotificationService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return null;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return null;
      }
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future registration(
    context,
    String email,
    String password,
  ) async {
    try {
      user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        NotificationService.showSnackBar(
          context,
          'Такой Email уже используется, повторите попытку с использованием другого Email',
          true,
        );
        return;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
      }
    }
  }

}
