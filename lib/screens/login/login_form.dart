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
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text('Đăng nhập tài khoản',
                  style: TextStyle(
                      color: Color.fromARGB(255, 85, 61, 95), fontSize: 20)),
              TextFormField(
                focusNode: accFocusNode,
                cursorColor: mainColors,
                decoration: InputDecoration(
                    labelText: 'Tài khoản',
                    labelStyle: TextStyle(
                        color: accFocusNode.hasFocus ? mainColors : null),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColors))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tài khoản';
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
                    labelText: 'Mật khẩu',
                    labelStyle: TextStyle(
                        color: passFocusNode.hasFocus ? mainColors : null),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainColors))),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
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
                        'nhớ tài khoản?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Quên mật khẩu?',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: mainColors),
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Kiểm tra thông tin...')));
                      context.goNamed('home');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Chưa có tài khoản?',
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: changeScreen,
                      child: const Text(
                        ' Đăng ký',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
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
