import 'package:flutter/material.dart';
import 'package:key_sk/form_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent)),
      home: const FormScreen(),
    );
  }
}
