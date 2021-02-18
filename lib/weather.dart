// Widgets file
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dateWidget = Container(
  child: Text(
    DateFormat('MMMM d, H:mm').format(DateTime.now()),
    style: TextStyle(
        color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 24),
  ),
);

Widget temperatureWidget = Container(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('20', // temperature
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
      Image.asset('images/cloudy.png', 
      width: 80, 
      height: 80, 
      fit: BoxFit.cover,
      )
    ],
  ),
);

    Widget descriptionWidget = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Accra',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Text('Cloudy',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );