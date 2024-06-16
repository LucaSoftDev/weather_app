import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/widgets/weather_image.dart';

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
    super.initState();

    _localWeatherStore.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Observer(builder: (context) {
              if (_localWeatherStore.isWaitingForLocation) {
                return _buildWaitingForLocation();
              } else if (_localWeatherStore.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return _buildWeatherInfo();
              }
            })),
      ),
    ));
  }

  Widget _buildWeatherInfo() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_localWeatherStore.formattedDate,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            WeatherImage(weatherCode: _localWeatherStore.weatherCode),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _localWeatherStore.temperature,
                  style: const TextStyle(fontSize: 96),
                ),
                Column(
                  children: [
                    Text(_localWeatherStore.weather ?? 'No weather data',
                        style: const TextStyle(fontSize: 24)),
                    Text(_localWeatherStore.weatherDescription)
                  ],
                )
              ],
            ),
          ],
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 16,
          child: ElevatedButton(
              onPressed: _localWeatherStore.fetchData,
              child: const Text('Update')),
        )
      ],
    );
  }

  Widget _buildWaitingForLocation() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: AssetImage('assets/images/no_weather_data.png'),
              width: 250,
              fit: BoxFit.cover),
          const SizedBox(height: 32),
          Text('Waiting for your location',
              style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
