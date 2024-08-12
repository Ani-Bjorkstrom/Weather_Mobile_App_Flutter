import 'package:flutter/material.dart';             // Import Flutter material package
import 'package:provider/provider.dart';            // Import Provider for state management
import 'package:weather_app/providers/weather_provider.dart'; // Import WeatherProvider
import 'package:weather_app/screens/home_screen.dart';        // Import HomeScreen
import 'package:weather_app/screens/about_screen.dart';       // Import AboutScreen

void main() {
  runApp(MyApp());                                  // Run the Flutter app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(                   // Use ChangeNotifierProvider for state management
      create: (context) => WeatherProvider(),        // Create an instance of WeatherProvider
      child: MaterialApp(                            // Create MaterialApp
        title: 'Weather App',                        // App title
        theme: ThemeData(
          primarySwatch: Colors.blue,                // Theme color
        ),
        home: HomeScreen(),                          // Set HomeScreen as the initial screen
        routes: {
          '/about': (context) => AboutScreen(),      // Define route for AboutScreen
        },
      ),
    );
  }
}

