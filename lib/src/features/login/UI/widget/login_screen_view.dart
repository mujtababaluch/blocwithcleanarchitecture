import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/login_bloc.dart';

class LoginScreenView extends StatelessWidget {
 LoginScreenView({super.key});

   final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32.0),
        TextField(
            controller: usernameController,
            decoration:   const  InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            decoration:const  InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
                 context.read<LoginBloc>().add(
                  LoginButtonPressed(
                    username: usernameController.text,
                    password: passwordController.text,
                  )
                 );
            },
            child: const Text('Login'),
          ),
        ],
      ),
  );
  }
}