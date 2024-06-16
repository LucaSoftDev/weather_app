import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';

import '../utils/helper.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  String? username;

  @observable
  String? password;

  @observable
  bool obscurePassword = true;

  @observable
  String? errorMessage;

  @observable
  bool success = false;

  @computed
  String? get usernameError {
    if (username == null) {
      return null;
    }
    if (username!.isEmpty) {
      return 'Username cannot be empty';
    }
    if (username!.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  @computed
  bool get isUsernameValid {
    return username != null && usernameError == null;
  }

  @computed
  String? get passwordError {
    if (password == null) {
      return null;
    }
    if (password!.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  @computed
  bool get isPasswordValid {
    return password != null && passwordError == null;
  }

  @computed
  bool get isFormValid {
    print(isUsernameValid);
    return isUsernameValid && isPasswordValid;
  }

  @action
  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
  }

  @action
  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storedUsername = prefs.getString('username_$username');
    var storedPassword = prefs.getString('password_$username');
    if (storedUsername == null || storedPassword == null) {
      errorMessage = 'Invalid user name or password';
      return;
    }
    var storedSalt = prefs.getString('salt_$username');
    var saltedPassword = password! + storedSalt!;
    var bytes = utf8.encode(saltedPassword);
    var digest = sha256.convert(bytes);

    if (digest.toString() != storedPassword) {
      errorMessage = 'Invalid user name or password';
      return;
    }

    success = true;
  }
}
