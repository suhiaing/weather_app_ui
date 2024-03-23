import 'package:flutter/material.dart';
import 'weather_screen_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
          useMaterial3: true), //not like color..this changes in every pages
      home: const WeatherScreen(),
    );
  }
}
