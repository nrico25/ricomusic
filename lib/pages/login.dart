import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login Page"),
        ),
      body: Center(
        child: Column(
          children: [
            Text("Press to move antoher page"),
            ElevatedButton(onPressed: () {
              Get.toNamed('/dashboard');
            }, child: Text("Login"))
          ],
        ),
      )
    );
}
}