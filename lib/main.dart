import 'package:flutter/material.dart';
import 'package:weather_app/weather_model.dart';
import './weather.dart';
import './http_api_request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherModel _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() {
    loadWeather(lat: 51.5085, lon: -0.1257);
    // loadWeather(lat: 40.71, lon: -74.01);
    print('----Getting http data----');
  }

  loadWeather({double lat, double lon}) async {
    HttpApiRequest myRequest = HttpApiRequest.getInstance();
    final data = await myRequest.getWeather(lat: lat, lon: lon);
    setState(() {
      this._weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(60.0),
          child: _weatherData != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dateWidget(_weatherData),
                    temperatureWidget(_weatherData),
                    descriptionWidget(_weatherData),
                  ],
                )
              : Center(
                  child: Container(
                  margin: EdgeInsets.all(20),
                  child: SizedBox(
                    width: 100, 
                    height: 100,
                    child: CircularProgressIndicator(strokeWidth: 5.0,))
                )),
        ));
  }
}
