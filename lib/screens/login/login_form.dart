import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginFrom extends HookConsumerWidget {
  const LoginFrom({required this.changeScreen, Key? key}) : super(key: key);
  final Function() changeScreen;

  final mainColors = const Color.fromARGB(255, 77, 97, 252);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = GlobalKey<FormState>();
    final isRemember = useState(false);
    final accFocusNode = useFocusNode();
    final passFocusNode = useFocusNode();
    return Form(
        key: loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text('Login account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 85, 61, 95), fontSize: 16)),
              TextFormField(
                focusNode: accFocusNode,
                cursorColor: mainColors,
                decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        color: accFocusNode.hasFocus ? mainColors : null),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColors))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                focusNode: passFocusNode,
                cursorColor: mainColors,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: passFocusNode.hasFocus ? mainColors : null),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColors))),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(mainColors),
                      value: isRemember.value,
                      onChanged: (value) {
                        isRemember.value = value!;
                      },
                    ),
                    InkWell(
                      onTap: () {
                        isRemember.value = !isRemember.value;
                      },
                      child: const Text(
                        'remember?',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    // const Spacer(),
                    // InkWell(
                    //   onTap: () {},
                    //   child: const Text(
                    //     'Quên mật khẩu?',
                    //     style:
                    //         TextStyle(color: Colors.blueAccent, fontSize: 12),
                    //   ),
                    // )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainColors),
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Che...')));
                      context.goNamed('home');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: changeScreen,
                      child: const Text(
                        ' Create account',
                        style:
                            TextStyle(fontSize: 14, color: Colors.blueAccent),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
