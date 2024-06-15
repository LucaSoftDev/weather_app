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
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: 'RegisterStoreBase.passwordError'))
          .value;
  Computed<String?>? _$passwordConfirmationErrorComputed;

  @override
  String? get passwordConfirmationError =>
      (_$passwordConfirmationErrorComputed ??= Computed<String?>(
              () => super.passwordConfirmationError,
              name: 'RegisterStoreBase.passwordConfirmationError'))
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

  late final _$registerAsyncAction =
      AsyncAction('RegisterStoreBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
passwordConfirmation: ${passwordConfirmation},
loginError: ${loginError},
passwordError: ${passwordError},
passwordConfirmationError: ${passwordConfirmationError},
isFormValid: ${isFormValid}
    ''';
  }
}
