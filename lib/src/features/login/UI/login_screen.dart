import 'package:flutter/material.dart';

import 'widget/login_screen_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child:  LoginScreenView(),
      ),
    );
  }
}