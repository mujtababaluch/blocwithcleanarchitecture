import 'package:flutter/material.dart';

import 'widget/login_screen_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Login')),
      body: const SafeArea(child:  LoginScreenView(),
      ),
    );
  }
}