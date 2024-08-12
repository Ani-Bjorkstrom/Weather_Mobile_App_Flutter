import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Weather?>? _weatherFuture;

  @override
  void initState() {
    super.initState();
    final weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    _weatherFuture = weatherProvider.fetchWeather();
  }

  Widget buildWeatherContent(Weather? weather) {
    if (weather == null) {
      return const Text(
        "Weather data not available.",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }

    String animationPath = 'assets/sunny.json'; // Default to sunny
    if (weather.description.contains('rain')) {
      animationPath = 'assets/rainy.json';
    } else if (weather.description.contains('cloud')) {
      animationPath = 'assets/cloudy.json';
    }

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(animationPath, fit: BoxFit.cover, height: 300),
          SizedBox(height: 10),
          Text(
            '${weather.cityName}, ${weather.country}', // Use cityName and country
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            weather.description,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            DateFormat.yMMMd().add_jm().format(weather.date),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          ElevatedButton.icon(
            icon: Icon(Icons.info_outline, size: 24, color: Colors.white),
            label: Text('About', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Weather?>(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Lottie.asset('assets/loading.json'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (snapshot.hasData) {
            return buildWeatherContent(snapshot.data);
          } else {
            return Center(child: Text('No weather data available'));
          }
        },
      ),
    );
  }
}
