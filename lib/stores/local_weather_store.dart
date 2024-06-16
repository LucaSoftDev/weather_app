import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';
import 'package:weather_app/utils/open_weather_api.dart';

import '../utils/helper.dart';

part 'local_weather_store.g.dart';

class LocalWeatherStore = LocalWeatherStoreBase with _$LocalWeatherStore;

abstract class LocalWeatherStoreBase with Store {
  @observable
  String? city;

  @observable
  String? weather;

  @observable
  String? temperature;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchWeather() async {
    try {
      final response = await OpenWeatherApi.getWeather('Sorocaba');
      weather = response?.weather?.first.description;
    } catch (e) {
      errorMessage = 'Failed to fetch weather';
    }
  }
}
