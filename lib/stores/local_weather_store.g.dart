// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalWeatherStore on LocalWeatherStoreBase, Store {
  late final _$cityAtom =
      Atom(name: 'LocalWeatherStoreBase.city', context: context);

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: 'LocalWeatherStoreBase.weather', context: context);

  @override
  String? get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(String? value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$temperatureAtom =
      Atom(name: 'LocalWeatherStoreBase.temperature', context: context);

  @override
  String? get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(String? value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'LocalWeatherStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchWeatherAsyncAction =
      AsyncAction('LocalWeatherStoreBase.fetchWeather', context: context);

  @override
  Future<void> fetchWeather() {
    return _$fetchWeatherAsyncAction.run(() => super.fetchWeather());
  }

  @override
  String toString() {
    return '''
city: ${city},
weather: ${weather},
temperature: ${temperature},
errorMessage: ${errorMessage}
    ''';
  }
}
