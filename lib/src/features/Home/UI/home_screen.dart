import 'package:flutter/material.dart';

import 'widgets/home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const SafeArea(child: SingleChildScrollView(
        child: HomeScreenView(),
      )),
    );
  }
}