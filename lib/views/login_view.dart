import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo-list');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
