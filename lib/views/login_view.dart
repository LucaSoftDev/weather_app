import 'package:flutter/gestures.dart';
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
      body: Stack(
        children: [
          const Positioned(
              left: 0,
              right: 0,
              top: 32,
              child: Center(
                  child: Text('Welcome Back',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)))),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Login',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  // get style from theme
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign up now',
                      style: TextStyle(color: Colors.deepPurple),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Sign up now');
                        },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
