import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';

import '../utils/helper.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String? username;

  @observable
  String? password;

  @observable
  String? passwordConfirmation;

  @observable
  bool obscurePassword = true;

  @observable
  bool obscurePasswordConfirmation = true;

  @observable
  String? errorMessage;

  @observable
  bool success = false;

  //Observable<bool> success = Observable(false);

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
  String? get passwordConfirmationError {
    if (passwordConfirmation == null) {
      return null;
    }
    if (passwordConfirmation!.isEmpty) {
      return 'Password confirmation cannot be empty';
    }
    if (password != passwordConfirmation) {
      return 'Password and password confirmation must match';
    }
    return null;
  }

  @computed
  bool get isPasswordConfirmationValid {
    return passwordConfirmation != null && passwordConfirmationError == null;
  }

  @computed
  bool get isFormValid {
    return isUsernameValid && isPasswordValid && isPasswordConfirmationValid;
  }

  @action
  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
  }

  @action
  void toggleObscurePasswordConfirmation() {
    obscurePasswordConfirmation = !obscurePasswordConfirmation;
  }

  @action
  Future<void> register() async {
    var salt = Helper.generateSalt(32);
    var saltedPassword = password! + salt;
    var bytes = utf8.encode(saltedPassword);
    var digest = sha256.convert(bytes);

    try {
      await _saveCredentials(digest, salt);
      success = true;
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> _saveCredentials(Digest digest, String salt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('username_$username')) {
      throw ErrorDescription('User already exists');
    }

    await prefs.setString('username_$username', username!);
    await prefs.setString('password_$username', digest.toString());
    await prefs.setString('salt_$username', salt);
  }
}
