// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterStoreBase, Store {
  Computed<String?>? _$loginErrorComputed;

  @override
  String? get loginError =>
      (_$loginErrorComputed ??= Computed<String?>(() => super.loginError,
              name: 'RegisterStoreBase.loginError'))
          .value;
  Computed<bool>? _$isLoginValidComputed;

  @override
  bool get isLoginValid =>
      (_$isLoginValidComputed ??= Computed<bool>(() => super.isLoginValid,
              name: 'RegisterStoreBase.isLoginValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: 'RegisterStoreBase.passwordError'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'RegisterStoreBase.isPasswordValid'))
          .value;
  Computed<String?>? _$passwordConfirmationErrorComputed;

  @override
  String? get passwordConfirmationError =>
      (_$passwordConfirmationErrorComputed ??= Computed<String?>(
              () => super.passwordConfirmationError,
              name: 'RegisterStoreBase.passwordConfirmationError'))
          .value;
  Computed<bool>? _$isPasswordConfirmationValidComputed;

  @override
  bool get isPasswordConfirmationValid =>
      (_$isPasswordConfirmationValidComputed ??= Computed<bool>(
              () => super.isPasswordConfirmationValid,
              name: 'RegisterStoreBase.isPasswordConfirmationValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'RegisterStoreBase.isFormValid'))
          .value;

  late final _$loginAtom =
      Atom(name: 'RegisterStoreBase.login', context: context);

  @override
  String? get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String? value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'RegisterStoreBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordConfirmationAtom =
      Atom(name: 'RegisterStoreBase.passwordConfirmation', context: context);

  @override
  String? get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String? value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  late final _$obscurePasswordAtom =
      Atom(name: 'RegisterStoreBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$obscurePasswordConfirmationAtom = Atom(
      name: 'RegisterStoreBase.obscurePasswordConfirmation', context: context);

  @override
  bool get obscurePasswordConfirmation {
    _$obscurePasswordConfirmationAtom.reportRead();
    return super.obscurePasswordConfirmation;
  }

  @override
  set obscurePasswordConfirmation(bool value) {
    _$obscurePasswordConfirmationAtom
        .reportWrite(value, super.obscurePasswordConfirmation, () {
      super.obscurePasswordConfirmation = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('RegisterStoreBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$RegisterStoreBaseActionController =
      ActionController(name: 'RegisterStoreBase', context: context);

  @override
  void toggleObscurePassword() {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.toggleObscurePassword');
    try {
      return super.toggleObscurePassword();
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleObscurePasswordConfirmation() {
    final _$actionInfo = _$RegisterStoreBaseActionController.startAction(
        name: 'RegisterStoreBase.toggleObscurePasswordConfirmation');
    try {
      return super.toggleObscurePasswordConfirmation();
    } finally {
      _$RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
passwordConfirmation: ${passwordConfirmation},
obscurePassword: ${obscurePassword},
obscurePasswordConfirmation: ${obscurePasswordConfirmation},
loginError: ${loginError},
isLoginValid: ${isLoginValid},
passwordError: ${passwordError},
isPasswordValid: ${isPasswordValid},
passwordConfirmationError: ${passwordConfirmationError},
isPasswordConfirmationValid: ${isPasswordConfirmationValid},
isFormValid: ${isFormValid}
    ''';
  }
}
