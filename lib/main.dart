import 'package:flutter/material.dart';
import 'package:weather_app/views/local_weather_view.dart';
import 'package:weather_app/views/login_view.dart';
import 'package:weather_app/views/register_view.dart';

import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 2,
          colors: [Colors.purple[50]!, Colors.blue[50]!, Colors.blue[100]!],
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.infinity, 48.0),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey[350]!;
                  }
                  return Colors.blue;
                },
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black87),
            bodySmall: TextStyle(color: Colors.black87),
            displayLarge: TextStyle(color: Colors.black87),
            displayMedium: TextStyle(color: Colors.black87),
            displaySmall: TextStyle(color: Colors.black87),
            headlineLarge: TextStyle(color: Colors.black87),
            headlineMedium: TextStyle(color: Colors.black87),
            headlineSmall: TextStyle(color: Colors.black87),
            titleLarge: TextStyle(color: Colors.black87),
            titleMedium: TextStyle(color: Colors.black87),
            titleSmall: TextStyle(color: Colors.black87),
            labelLarge: TextStyle(color: Colors.black87),
            labelMedium: TextStyle(color: Colors.black87),
            labelSmall: TextStyle(color: Colors.black87),
          ),
        ),
        home: const LocalWeatherView(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        routes: {
          '/login_view': (context) => const LoginView(),
          '/register_view': (context) => const RegisterView(),
          '/home_view': (context) => const HomeView(),
          '/local_weather_view': (context) => const LocalWeatherView(),
        },
      ),
    );
  }
}
