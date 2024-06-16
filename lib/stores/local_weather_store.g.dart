// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalWeatherStore on LocalWeatherStoreBase, Store {
  Computed<String>? _$formattedDateComputed;

  @override
  String get formattedDate =>
      (_$formattedDateComputed ??= Computed<String>(() => super.formattedDate,
              name: 'LocalWeatherStoreBase.formattedDate'))
          .value;
  Computed<String>? _$temperatureComputed;

  @override
  String get temperature =>
      (_$temperatureComputed ??= Computed<String>(() => super.temperature,
              name: 'LocalWeatherStoreBase.temperature'))
          .value;
  Computed<String>? _$weatherDescriptionComputed;

  @override
  String get weatherDescription => (_$weatherDescriptionComputed ??=
          Computed<String>(() => super.weatherDescription,
              name: 'LocalWeatherStoreBase.weatherDescription'))
      .value;

  late final _$latitudeAtom =
      Atom(name: 'LocalWeatherStoreBase.latitude', context: context);

  @override
  double? get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double? value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longitudeAtom =
      Atom(name: 'LocalWeatherStoreBase.longitude', context: context);

  @override
  double? get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double? value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  late final _$_dateTimeAtom =
      Atom(name: 'LocalWeatherStoreBase._dateTime', context: context);

  @override
  DateTime? get _dateTime {
    _$_dateTimeAtom.reportRead();
    return super._dateTime;
  }

  @override
  set _dateTime(DateTime? value) {
    _$_dateTimeAtom.reportWrite(value, super._dateTime, () {
      super._dateTime = value;
    });
  }

  late final _$_cityAtom =
      Atom(name: 'LocalWeatherStoreBase._city', context: context);

  @override
  String? get _city {
    _$_cityAtom.reportRead();
    return super._city;
  }

  @override
  set _city(String? value) {
    _$_cityAtom.reportWrite(value, super._city, () {
      super._city = value;
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

  late final _$_weatherDescriptionAtom =
      Atom(name: 'LocalWeatherStoreBase._weatherDescription', context: context);

  @override
  String? get _weatherDescription {
    _$_weatherDescriptionAtom.reportRead();
    return super._weatherDescription;
  }

  @override
  set _weatherDescription(String? value) {
    _$_weatherDescriptionAtom.reportWrite(value, super._weatherDescription, () {
      super._weatherDescription = value;
    });
  }

  late final _$_temperatureAtom =
      Atom(name: 'LocalWeatherStoreBase._temperature', context: context);

  @override
  double? get _temperature {
    _$_temperatureAtom.reportRead();
    return super._temperature;
  }

  @override
  set _temperature(double? value) {
    _$_temperatureAtom.reportWrite(value, super._temperature, () {
      super._temperature = value;
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

  late final _$weatherCodeAtom =
      Atom(name: 'LocalWeatherStoreBase.weatherCode', context: context);

  @override
  String? get weatherCode {
    _$weatherCodeAtom.reportRead();
    return super.weatherCode;
  }

  @override
  set weatherCode(String? value) {
    _$weatherCodeAtom.reportWrite(value, super.weatherCode, () {
      super.weatherCode = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('LocalWeatherStoreBase.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$_fetchLocationAsyncAction =
      AsyncAction('LocalWeatherStoreBase._fetchLocation', context: context);

  @override
  Future<void> _fetchLocation() {
    return _$_fetchLocationAsyncAction.run(() => super._fetchLocation());
  }

  late final _$_fetchWeatherAsyncAction =
      AsyncAction('LocalWeatherStoreBase._fetchWeather', context: context);

  @override
  Future<void> _fetchWeather() {
    return _$_fetchWeatherAsyncAction.run(() => super._fetchWeather());
  }

  @override
  String toString() {
    return '''
latitude: ${latitude},
longitude: ${longitude},
weather: ${weather},
errorMessage: ${errorMessage},
weatherCode: ${weatherCode},
formattedDate: ${formattedDate},
temperature: ${temperature},
weatherDescription: ${weatherDescription}
    ''';
  }
}
