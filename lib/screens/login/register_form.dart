import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterForm extends HookConsumerWidget {
  const RegisterForm({required this.changeScreen, Key? key}) : super(key: key);
  final Function() changeScreen;

  final mainColors = const Color.fromARGB(255, 77, 97, 252);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFormKey = GlobalKey<FormState>();
    final accFocusNode = useFocusNode();
    final passFocusNode = useFocusNode();
    final rePassFocusNode = useFocusNode();
    return Form(
        key: registerFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text('Create account!',
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
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                focusNode: rePassFocusNode,
                cursorColor: mainColors,
                decoration: InputDecoration(
                    labelText: 'Re-type Password',
                    labelStyle: TextStyle(
                        color: passFocusNode.hasFocus ? mainColors : null),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColors))),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Re-type password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainColors),
                  onPressed: () {
                    if (registerFormKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //     content: Text('Kiểm tra thông tin...')));
                      changeScreen();
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
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: changeScreen,
                      child: const Text(
                        ' Login',
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
