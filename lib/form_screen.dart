import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                } else {}
              },
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Bitte eine Email eingeben';
    }
    // Check if the email format is valid
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(input)) {
      return 'gültige Email-Adresse eingeben';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return ' Passwort eingeben';
    }
    if (input.length < 8) {
      return 'Das Passwort muss mindestens 8 Zeichen lang sein';
    }
    return null;
  }
}
