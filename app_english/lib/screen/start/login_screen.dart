import 'package:app_english/models/app_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_english/services/firebase/notification.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _LoginState();
}

class _LoginState extends State<Login_screen> {
  // скрыт / показать пароль
  bool isHiddenPassword = false;
  // переменные данных
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // очистка памяти
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // переключатель показа пароля
  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  // логин
  // void login() async {
  //   final navigator = Navigator.of(context);
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) return;
  //   //login(context,email,password);
  //   navigator.pushNamedAndRemoveUntil(
  //       AppRoute.home, (Route<dynamic> route) => false);
  // }

  Future<void> login() async {
// для чего это
    final navigator = Navigator.of(context);
// форма заполнена
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // try-catch на авторизацию
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        // передача данных с отбрасыванием последних символов
        email: email.text.trim(),
        password: password.text.trim(),
      );
      // отлавливатель ошибок
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        NotificationService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        NotificationService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }
    // переход в меню после регистрации
    navigator.pushNamedAndRemoveUntil(
        AppRoute.home, (Route<dynamic> route) => false);
  }

// экран нашего входа
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Войти'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // поле email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: email,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Введите правильный Email'
                        : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите Email',
                ),
              ),
              //пустое пространство
              const SizedBox(height: 30),
              // поле для пароля
              TextFormField(
                autocorrect: false,
                controller: password,
                obscureText: isHiddenPassword,
                validator: (value) => value != null && value.length < 6
                    ? 'Минимум 6 символов'
                    : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              // снова же пустое протранство
              const SizedBox(height: 30),
              // кнопка для входа которая перебрасывает нас в функцию login
              ElevatedButton(
                onPressed: login,
                child: const Center(child: Text('Войти')),
              ),
              // и опять пустое пространство
              const SizedBox(height: 30),
              // кнопка если мы передумали и у нас все же нет аккаунта
              TextButton(
                // при нажатии переходим в окно регистрации
                onPressed: () => Navigator.of(context).pushNamed('/reg'),
                child: const Text(
                  'Регистрация',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              // мы думаем что у нас есть акккунт но мы забыли паспрот )
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/reset_password'),
                child: const Text('Сбросить пароль'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
