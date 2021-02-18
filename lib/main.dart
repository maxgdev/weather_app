import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dateWidget,
              temperatureWidget
            ],
          ),
        ));
  }
}

// Widgets - export to seperate file
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
      // Text('\u2103',style: TextStyle(fontSize: 74,color: Colors.blueAccent)),
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
      Image.asset('images/cloudy.png', width: 80, height: 80, fit: BoxFit.cover,)
    ],
  ),
);
