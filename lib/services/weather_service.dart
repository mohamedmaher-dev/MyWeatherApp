// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:myweatherapp/models/weather_model.dart';
import 'dart:convert';
import 'package:myweatherapp/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherService {
  final BuildContext context;
  final Position position;

  Response? _response;
  String? _url;

  WeatherService({
    required this.context,
    required this.position,
  });
  Future<dynamic> getJson() async {
    _url =
        "http://api.weatherapi.com/v1/current.json?key=7ad7498f26274f0794d00527231307&q=${position.latitude},${position.longitude}&aqi=no";
    _response = await get(Uri.parse(_url!));
    print(_url);
    Map<String, dynamic> fromJson = await jsonDecode(_response!.body);
    Provider.of<WeatherProvider>(context, listen: false).weatherModel =
        WeatherModel.fromJson(fromJson: fromJson);
    if (Provider.of<WeatherProvider>(context, listen: false).refresh == false) {
      Provider.of<WeatherProvider>(context, listen: false).refresh = true;
      Navigator.of(context).pushReplacementNamed("home");
    }
  }
}
