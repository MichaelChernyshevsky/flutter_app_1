import 'package:app_english/models/app_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase/notification.dart';

class Registration_screen extends StatefulWidget {
  const Registration_screen({super.key});

  @override
  State<Registration_screen> createState() => _Registration();
}

class _Registration extends State<Registration_screen> {
  // показать / скрыть пароль
  bool isHiddenPassword = true;
  //      поля для наших данных
  // основне
  TextEditingController email11 = TextEditingController();
  TextEditingController passwordMain11 = TextEditingController();
  //проверочное
  TextEditingController passwordCheck11 = TextEditingController();
// снова ....
  final formKey = GlobalKey<FormState>();

  // очистка наших данных
  @override
  void dispose() {
    email11.dispose();
    passwordMain11.dispose();
    passwordCheck11.dispose();
    super.dispose();
  }

  // переключатель показа паролей
  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
  // регистрация в Firebase

  // void signUp() async {
  //   final navigator = Navigator.of(context);
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) return;
  //   if (passwordCheck11.text != passwordMain11.text) {
  //     NotificationService.showSnackBar(
  //       context,
  //       'Пароли должны совпадать',
  //       true,
  //     );
  //   }
  //   // registration(context, email, passwordMain11)
  //    navigator.pushNamedAndRemoveUntil(
  //       AppRoute.initial, (Route<dynamic> route) => false);
  // }
  Future<void> signUp() async {
    final navigator = Navigator.of(context);
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    //  проверка совпадают ли пароли
    if (passwordCheck11.text != passwordMain11.text) {
      NotificationService.showSnackBar(
        context,
        'Пароли должны совпадать',
        true,
      );
      return;
    }
    // регистрация пользователя в Firebase
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email11.text.trim(),
        password: passwordMain11.text.trim(),
      );
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
    // после регистрации переход возвращаемся и завершаем вход
    navigator.pushNamedAndRemoveUntil(
        AppRoute.initial, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Зарегистрироваться'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: email11,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
                        : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите Email',
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                controller: passwordMain11,
                obscureText: isHiddenPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Введите пароль',
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                controller: passwordCheck11,
                obscureText: isHiddenPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Введите пароль еще раз',
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                      isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: signUp,
                child: const Center(child: Text('Регистрация')),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Войти',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
