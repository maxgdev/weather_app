// [OpenWeather API] (https://openweathermap.org/)

import 'dart:convert';

class WeatherModel {
  //Define data model
  final String name;
  final double temp;
  final String main;
  final String icon;
  // Constructor
  WeatherModel({this.name, this.temp, this.main, this.icon});
  // methods
  static WeatherModel deserialize(String jsonData) {
    JsonDecoder decoder = JsonDecoder();
    var mapData = decoder.convert(jsonData);

    String name = mapData['name'];
    double temp = mapData['main']['temp'].toDouble();
    String main = mapData['weather'][0]['main'];
    String icon = mapData['weather'][0]['icon'];

    return WeatherModel(name: name, temp: temp, main: main, icon: icon);
  }
}
