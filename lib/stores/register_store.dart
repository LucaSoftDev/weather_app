import 'dart:math';

import 'package:flutter/material.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';

import '../utils/helper.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  @observable
  String? login;

  @observable
  String? password;

  @observable
  String? passwordConfirmation;

  @observable
  bool obscurePassword = true;

  @observable
  bool obscurePasswordConfirmation = true;

  @computed
  String? get loginError {
    if (login == null) {
      return null;
    }
    if (login!.isEmpty) {
      return 'Login cannot be empty';
    }
    if (login!.length < 3) {
      return 'Login must be at least 3 characters long';
    }
    return null;
  }

  @computed
  bool get isLoginValid {
    return login != null && loginError == null;
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
    return isLoginValid && isPasswordValid && isPasswordConfirmationValid;
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
    } catch (e) {
      throw Exception('Registration failed');
    }
  }

  Future<void> _saveCredentials(Digest digest, String salt) async {
    // Store the username and hashed password in local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', login!);
    await prefs.setString('password', digest.toString());
    await prefs.setString('salt', salt);
  }
