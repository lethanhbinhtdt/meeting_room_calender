import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meeting_room_calender/screens/login/register_form.dart';

import 'login_form.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();
    final _registerFormKey = GlobalKey<FormState>();
    final isLogin = useState(false);
    return MaterialApp(
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 241, 241, 241)),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Icon(
                      //   Icons.login,
                      //   size: 48,
                      //   color: Color.fromARGB(255, 113, 129, 253),
                      // ),
                      Image.asset('images/logoNoneBackground.png'),
                      const Text('ISV Việt Nam',
                          style: TextStyle(
                              color: Color.fromARGB(255, 85, 61, 95),
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      isLogin.value
                          ? LoginFrom(
                              loginFormKey: _loginFormKey,
                              changeScreen: () {
                                isLogin.value = false;
                              })
                          : RegisterForm(
                              registerFormKey: _registerFormKey,
                              changeScreen: () {
                                isLogin.value = true;
                              }),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
