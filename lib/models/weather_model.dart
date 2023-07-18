class WeatherModel {
  String location;
  String country;
  String localtime;
  String lastUpdate;
  String tip;
  String image;
  double degree;
  String wind;
  String humidity;
  String cloud;
  String uv;
  String pressure;
  String precipitation;
  String visibility;

  WeatherModel({
    required this.location,
    required this.country,
    required this.localtime,
    required this.lastUpdate,
    required this.tip,
    required this.image,
    required this.degree,
    required this.wind,
    required this.humidity,
    required this.cloud,
    required this.uv,
    required this.pressure,
    required this.precipitation,
    required this.visibility,
  });

  factory WeatherModel.fromJson({required dynamic fromJson}) {
    return WeatherModel(
      location: fromJson["location"]["name"],
      country: fromJson["location"]["region"],
      localtime: fromJson["location"]["localtime"],
      lastUpdate: fromJson["current"]["last_updated"],
      tip: fromJson["current"]["condition"]["text"],
      image: fromJson["current"]["condition"]["icon"],
      degree: fromJson["current"]["temp_c"],
      wind: fromJson["current"]["wind_kph"].toString(),
      humidity: fromJson["current"]["humidity"].toString(),
      cloud: fromJson["current"]["cloud"].toString(),
      uv: fromJson["current"]["uv"].toString(),
      pressure: fromJson["current"]["pressure_mb"].toString(),
      precipitation: fromJson["current"]["precip_mm"].toString(),
      visibility: fromJson["current"]["vis_km"].toString(),
    );
  }
}
