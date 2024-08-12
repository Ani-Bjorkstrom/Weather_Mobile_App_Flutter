import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _currentWeather;
  final WeatherService _weatherService = WeatherService();

  Future<Weather?> fetchWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _currentWeather = await _weatherService.fetchWeather(position.latitude, position.longitude);
    } catch (e) {
      _currentWeather = null; // Ensure _currentWeather is null if an error occurs
      print('Failed to fetch weather: $e');
    }

    notifyListeners();
    return _currentWeather;
  }

  Weather? get currentWeather => _currentWeather;
}


