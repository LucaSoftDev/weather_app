import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/local_weather_store.dart';

class LocalWeatherView extends StatefulWidget {
  const LocalWeatherView({super.key});

  @override
  State<LocalWeatherView> createState() => _LocalWeatherViewState();
}

class _LocalWeatherViewState extends State<LocalWeatherView> {
  final LocalWeatherStore _localWeatherStore = LocalWeatherStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _localWeatherStore.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_localWeatherStore.weather ?? 'No weather data'),
            ElevatedButton(
                onPressed: _localWeatherStore.fetchWeather,
                child: Text('Get Weather'))
          ],
        );
      }),
    ));
  }
}
