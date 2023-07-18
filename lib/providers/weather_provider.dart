import 'package:flutter/material.dart';
import 'package:myweatherapp/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  bool refresh = false;
  WeatherModel? _weatherModel;

  set weatherModel(WeatherModel? weatherModel) {
    _weatherModel = weatherModel;
    notifyListeners();
  }

  WeatherModel? get weatherModel => _weatherModel;
}
