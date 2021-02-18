import 'package:http/http.dart' show Client;
import './weather_model.dart';

class HttpApiRequest {
  // Add your http://openweathermap.org api key here
  // git_test API key - temp,time limited key
  static const _apiKey = '7f49525f4792d546d946a1d9ac4e0738';
  static const _endpoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();

  static HttpApiRequest _instance;
  static HttpApiRequest getInstance() => _instance ??= HttpApiRequest();

  String _apiCall({double lat, double lon}) {
    return _endpoint +
        "/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&APPID=" +
        _apiKey +
        "&units=metric";
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
        Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
        headers: {'Accept': 'application/json'});
    return WeatherModel.deserialize(response.body);
  }
}
