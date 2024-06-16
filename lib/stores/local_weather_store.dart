import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/utils/open_weather_api.dart';

import '../utils/location.dart';

part 'local_weather_store.g.dart';

class LocalWeatherStore = LocalWeatherStoreBase with _$LocalWeatherStore;

abstract class LocalWeatherStoreBase with Store {
  @observable
  double? latitude;

  @observable
  double? longitude;

  @observable
  DateTime? dateTime;

  @observable
  String? _city;

  @observable
  String? weather;

  @observable
  String? _weatherDescription;

  @observable
  double? _temperature;

  @observable
  String? errorMessage;

  @computed
  String get formattedDate {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('EEEE dd MMMM yyyy').format(dateTime!);
  }

  @computed
  String get temperature {
    if (_temperature == null) {
      return 'No temperature data';
    }
    return '${_temperature!.round()}°C';
  }

  @computed
  String get weatherDescription {
    if (_weatherDescription == null || _city == null) {
      return 'No weather description data';
    }
    return '$_weatherDescription in $_city';
  }

  @action
  Future<void> fetchData() async {
    await _fetchLocation();
    await _fetchWeather();
  }

  @action
  Future<void> _fetchLocation() async {
    try {
      var location = await Location.getUserLocation();
      latitude = location.latitude;
      longitude = location.longitude;
    } catch (e) {
      errorMessage = 'Failed to fetch location';
    }
  }

  @action
  Future<void> _fetchWeather() async {
    try {
      final response =
          await OpenWeatherApi.getWeatherByLocation(latitude!, longitude!);
      weather = response?.weather?.first.main;
      _weatherDescription = response?.weather?.first.description;
      _city = response?.name;
      _temperature = response?.main?.temp;
      dateTime = DateTime.now();
    } catch (e) {
      errorMessage = 'Failed to fetch weather';
    }
  }
}
