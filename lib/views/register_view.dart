import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home_view');
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
              left: 0,
              right: 0,
              top: 32,
              child: Center(
                  child: Text('Create an Account',
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
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password Confirmation',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sign Up'),
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
                  text: 'Already have an account? ',
                  // get style from theme
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign in Now',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/login_view');
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
