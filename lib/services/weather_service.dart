import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  final String apiKey = '399681d535ba5009e97c752c5cbffa01'; 

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    // Async function to fetch weather data based on latitude and longtitude

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey'));    
    // Send GET request to OpenWeatherMap API

    if (response.statusCode == 200) {
      print("API Response: ${response.body}");
      return Weather.fromJson(jsonDecode(response.body));
    }
    else {
      print("Failed to load weather data. Status Code: ${response.statusCode}");
      throw Exception('Failed to load weather');
    }

  }
}