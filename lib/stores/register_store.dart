import 'package:flutter/material.dart';

// import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String? login;

  @observable
  String? password;

  @observable
  String? passwordConfirmation;

  @computed
  String? get loginError {
    if (login != null && login!.isEmpty) {
      return 'Login cannot be empty';
    }
    return null;
  }

  @computed
  String? get passwordError {
    if (password != null && password!.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  @computed
  String? get passwordConfirmationError {
    if (passwordConfirmation != null && passwordConfirmation!.isEmpty) {
      return 'Password confirmation cannot be empty';
    }
    if (passwordConfirmation != null && password != passwordConfirmation) {
      return 'Password and password confirmation must match';
    }
    return null;
  }

  @computed
  bool get isFormValid {
    return (login?.isNotEmpty ?? false) &&
        (password?.isNotEmpty ?? false) &&
        (passwordConfirmation?.isNotEmpty ?? false) &&
        password == passwordConfirmation;
  }

  @action
  Future<void> register() async {
    // Validate the username and password
    // if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    //   throw Exception(
    //       'Username, password and confirmation password must not be empty');
    // }
    //
    // if (password != confirmPassword) {
    //   throw Exception('Password and confirmation password must match');
    // }

    // Hash the password
    // var bytes = utf8.encode(password); // data being hashed
    // var digest = sha256.convert(bytes);

    // Store the username and hashed password in local storage
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('username', username);
    // await prefs.setString('password', digest.toString());

    // If the registration was not successful, throw an error
    // if (!success) {
    //   throw Exception('Registration failed');
    // }
  }

// final TextEditingController loginController = TextEditingController();
// final TextEditingController passwordController = TextEditingController();
// final TextEditingController confirmPasswordController =
//     TextEditingController();
//
// String? get loginError {
//   if (loginController.text.isEmpty) {
//     return 'Login cannot be empty';
//   }
//   return null;
// }
//
// bool get isFormValid {
//   return loginController.text.isNotEmpty &&
//       passwordController.text.isNotEmpty &&
//       confirmPasswordController.text.isNotEmpty;
// }

// Future<void> register() async {
// Validate the username and password
// if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//   throw Exception(
//       'Username, password and confirmation password must not be empty');
// }
//
// if (password != confirmPassword) {
//   throw Exception('Password and confirmation password must match');
// }

// Hash the password
// var bytes = utf8.encode(password); // data being hashed
// var digest = sha256.convert(bytes);

// Store the username and hashed password in local storage
// SharedPreferences prefs = await SharedPreferences.getInstance();
// await prefs.setString('username', username);
// await prefs.setString('password', digest.toString());

// If the registration was not successful, throw an error
// if (!success) {
//   throw Exception('Registration failed');
// }
// }
}
