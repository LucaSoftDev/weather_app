import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({super.key, required this.weatherCode});

  final String? weatherCode;

  @override
  Widget build(BuildContext context) {
    final Image image;
    switch (weatherCode) {
      case '01d':
        image = Image.asset('assets/images/clear_sky_day.png');
        break;
      case '01n':
        image = Image.asset('assets/images/clear_sky_night.png');
        break;
      case '02d':
        image = Image.asset('assets/images/few_clouds_day.png');
      case '02n':
        image = Image.asset('assets/images/few_clouds_night.png');
        break;
      case '03d':
      case '03n':
        image = Image.asset('assets/images/scattered_clouds.png');
        break;
      case '04d':
      case '04n':
      case '50d':
      case '50n':
        image = Image.asset('assets/images/broken_clouds.png');
        break;
      case '09d':
      case '09n':
        image = Image.asset('assets/images/shower_rain.png');
        break;
      case '10d':
      case '10n':
        image = Image.asset('assets/images/rain.png');
        break;
      case '11d':
      case '11n':
        image = Image.asset('assets/images/rain.png');
        break;
      case '13d':
      case '13n':
        image = Image.asset('assets/images/snow.png');
        break;
      default:
        image = Image.asset('assets/images/no_weather_data.png');
        break;
    }
    return Image(image: image.image, fit: BoxFit.cover, width: 250);
  }
}
