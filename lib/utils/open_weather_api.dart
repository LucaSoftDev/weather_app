import 'dart:convert';

import 'package:http/http.dart' as http;

import '../consts/weather_units.dart';
import '../models/weather_response.dart';

class OpenWeatherApi {
  static const String _baseUrl =
      String.fromEnvironment('OPEN_WEATHER_BASE_URL');
  static const String _apiKey = String.fromEnvironment('OPEN_WEATHER_API_KEY');
  static const String _dataUrl =
      String.fromEnvironment('OPEN_WEATHER_DATA_PATH');

  static Future<WeatherResponse?> getWeather(String city,
      {Unit unit = Unit.metric}) async {
    late Uri uri;
    uri = Uri.https(
        _baseUrl, _dataUrl, {'q': city, 'appid': _apiKey, 'units': unit.value});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
