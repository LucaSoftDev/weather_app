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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login'),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Login',
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
