import 'package:flutter/material.dart';
import 'package:myweatherapp/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:myweatherapp/pages/splash.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        home: const Splash(),
        routes: {
          "home": (context) => const Home(),
        },
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
