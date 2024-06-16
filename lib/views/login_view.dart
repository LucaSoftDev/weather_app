import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../stores/login_store.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginStore _loginStore = LoginStore();

  late final ReactionDisposer _successReactionDisposer;
  late final ReactionDisposer _errorReactionDisposer;

  @override
  void initState() {
    super.initState();
    _successReactionDisposer = reaction(
      (_) => _loginStore.success,
      (success) {
        if (success) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/local_weather_view', (route) => false);
        }
      },
    );

    _errorReactionDisposer = reaction(
      (_) => _loginStore.errorMessage,
      (errorMessage) {
        if (errorMessage?.isNotEmpty ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
          _loginStore.errorMessage = null;
        }
      },
    );
  }

  @override
  void dispose() {
    _successReactionDisposer();
    _errorReactionDisposer();
    super.dispose();
  }

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
                  child: Text('Welcome Back',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)))),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Observer(builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) => _loginStore.username = value,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          errorText: _loginStore.usernameError),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) => _loginStore.password = value,
                      obscureText: _loginStore.obscurePassword,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              _loginStore.toggleObscurePassword();
                            },
                          ),
                        ),
                        hintText: 'Password',
                        errorText: _loginStore.passwordError,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(builder: (context) {
                            return ElevatedButton(
                              onPressed: _loginStore.isFormValid
                                  ? () {
                                      _loginStore.login();
                                    }
                                  : null,
                              child: const Text('Login'),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                );
              }),
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
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/register_view');
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
