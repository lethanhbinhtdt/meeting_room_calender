import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends HookWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/logoNoneBackground.png'),
                    const Text('ISV Việt Nam',
                        style: TextStyle(
                            color: Color.fromARGB(255, 85, 61, 95),
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Đã xảy ra sự cố!',
                        style: TextStyle(fontSize: 36, color: Colors.redAccent),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        context.goNamed('home');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Về trang chủ',
                            style:
                                TextStyle(fontSize: 28, color: Colors.white)),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
      },
    );
  }
}
