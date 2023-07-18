// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweatherapp/componets/custom_dialog.dart';
import 'package:myweatherapp/services/weather_service.dart';

class LocationService {
  final BuildContext context;
  CustomDialog? customDialog;

  LocationService({
    required this.context,
  });

  start() async {
    await _checkPermission();
  }

  Future<void> _checkPermission() async {
    LocationPermission checkPermission = await Geolocator.checkPermission();
    if (checkPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      start();
    } else {
      await _checkLocation();
    }
  }

  Future<void> _checkLocation() async {
    bool locEnable = await Geolocator.isLocationServiceEnabled();
    if (locEnable) {
      await _getCurrentPostion();
    } else {
      customDialog = CustomDialog(
        context: context,
        title: "Error",
        desc: "Please Enable The Location (GPS)",
      );
    }
  }

  Future<void> _getCurrentPostion() async {
    await Geolocator.getCurrentPosition().then(
      (value) async {
        WeatherService(context: context, position: value).getJson();
      },
    );
  }
}
