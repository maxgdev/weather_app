// Widgets file
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather_model.dart';

dateWidget(WeatherModel data){
  return  Container(
  child: Text(
    DateFormat('MMMM d, H:mm').format(DateTime.now()),
    style: TextStyle(
        color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 24),
  ),
);
} 

temperatureWidget(WeatherModel data) {
  return Container(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(data.temp.toStringAsFixed(0), // temperature
      style: TextStyle(fontSize: 74,color: Colors.blueAccent),),
      Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 12.0,
              ),
              margin: EdgeInsets.only(
                left: 6.0,
              ),
              child: Text(
                '\u2103', // celsius unicode
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.blueAccent
                ),
              ),
            ),
          ),
      Image.network(
            'https://openweathermap.org/img/w/${data.icon}.png', 
      width: 80, 
      height: 80, 
      fit: BoxFit.cover,
      )
    ],
  ),
);
}  

descriptionWidget(WeatherModel data){
  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.name,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Text(data.main,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
} 