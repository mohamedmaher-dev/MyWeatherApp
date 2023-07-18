// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:myweatherapp/componets/custom_text.dart';
import 'package:myweatherapp/componets/custom_top_card.dart';
import 'package:myweatherapp/componets/custom_bottom_card.dart';
import 'package:myweatherapp/componets/custom_row.dart';
import 'package:myweatherapp/models/weather_model.dart';
import 'package:provider/provider.dart';
import 'package:myweatherapp/providers/weather_provider.dart';
import 'package:myweatherapp/services/location_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        Provider.of<WeatherProvider>(context, listen: true).weatherModel;
    return Scaffold(
      body: Container(
        color: const Color(0xFF081A24),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: boxDeco(),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          LocationService(context: context).start();
                        },
                        icon: const Icon(Icons.refresh)),
                    CustomText(
                      text: "${weatherModel!.localtime}",
                      textColor: Colors.white54,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    const Spacer(flex: 1),
                    CustomText(
                        text:
                            "${weatherModel.location} - ${weatherModel.country}",
                        textColor: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    CustomText(
                        text: "Last Update ${weatherModel.lastUpdate}",
                        textColor: Colors.white54,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                    const Spacer(flex: 1),
                    Expanded(
                        flex: 2,
                        child: Image.asset("assets/images/weather.png")),
                    CustomText(
                        text: "${weatherModel.tip}",
                        textColor: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    CustomText(
                        text: "${(weatherModel.degree).toInt()}°",
                        textColor: Colors.white,
                        fontSize: 75,
                        fontWeight: FontWeight.bold),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 1,
                      child: CustomRow(
                        children: [
                          CustomTopCard(
                              data: "${weatherModel.wind} km/h",
                              icon: Icons.wind_power,
                              title: "Wind"),
                          CustomTopCard(
                              data: "${weatherModel.humidity}%",
                              icon: Icons.water,
                              title: "Humidity"),
                          CustomTopCard(
                              data: "${weatherModel.cloud}%",
                              icon: Icons.cloud,
                              title: "Cloud"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1),
                  CustomRow(
                    children: [
                      CustomBottomCard(
                        data: "${weatherModel.uv}",
                        title: "Air Quality",
                      ),
                      CustomBottomCard(
                        data: "${weatherModel.uv}",
                        title: "UV",
                      ),
                      CustomBottomCard(
                          data: "${weatherModel.wind} km/h", title: "Wind"),
                    ],
                  ),
                  const Spacer(flex: 1),
                  CustomRow(
                    children: [
                      CustomBottomCard(
                          data: "${weatherModel.pressure} mp",
                          title: "Pressure"),
                      CustomBottomCard(
                          data: "${weatherModel.precipitation} mm",
                          title: "Precipitation"),
                      CustomBottomCard(
                          data: "${weatherModel.visibility} km",
                          title: "Visibility"),
                    ],
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDeco() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF3EA2FA),
          Color(0xFF945BD1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
    );
  }
}
