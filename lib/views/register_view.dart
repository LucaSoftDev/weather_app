import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../stores/register_store.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterStore _registerStore = RegisterStore();

  late final ReactionDisposer _successReactionDisposer;
  late final ReactionDisposer _errorReactionDisposer;

  @override
  void initState() {
    super.initState();
    _successReactionDisposer = reaction(
      (_) => _registerStore.success,
      (success) {
        if (success) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/local_weather_view', (route) => false);
        }
      },
    );

    _errorReactionDisposer = reaction(
      (_) => _registerStore.errorMessage,
      (errorMessage) {
        if (errorMessage?.isNotEmpty ?? false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
          _registerStore.errorMessage = null;
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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Stack(
            children: [
              const Positioned(
                  left: 0,
                  right: 0,
                  top: 32,
                  child: Center(
                      child: Text('Create an Account',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Observer(builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: (value) => _registerStore.username = value,
                        decoration: InputDecoration(
                            hintText: 'User Name',
                            errorText: _registerStore.usernameError),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: _registerStore.obscurePassword,
                        onChanged: (value) => _registerStore.password = value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            errorText: _registerStore.passwordError,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: IconButton(
                                  icon: Icon(_registerStore.obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed:
                                      _registerStore.toggleObscurePassword),
                            )),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: _registerStore.obscurePasswordConfirmation,
                        onChanged: (value) =>
                            _registerStore.passwordConfirmation = value,
                        decoration: InputDecoration(
                          hintText: 'Password Confirmation',
                          errorText: _registerStore.passwordConfirmationError,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                                icon: Icon(
                                    _registerStore.obscurePasswordConfirmation
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                onPressed: _registerStore
                                    .toggleObscurePasswordConfirmation),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Row(
                        children: [
                          Expanded(
                            child: Observer(builder: (context) {
                              return ElevatedButton(
                                onPressed: _registerStore.isFormValid
                                    ? _registerStore.register
                                    : null,
                                child: const Text('Sign Up'),
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
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
                          style: const TextStyle(color: Colors.blue),
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
        ),
      ),
    );
  }
}
