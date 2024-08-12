import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Weather App'),
        backgroundColor: Colors.blue,  // Ensures the app bar matches the theme of the app
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Aligns children to the center vertically
            children: [
              // Removed the Image.asset line
              SizedBox(height: 20),
              Text(
                'About the Weather App',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This Weather App is designed to provide up-to-date weather information, '
                'bringing you detailed weather forecasts including temperature, wind speed, and more. '
                'Whether you need to check the weather for travel, work, or just your daily life, '
                'our app ensures you’re always prepared.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,  // Increases line height for better readability
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Developed with ❤️ by Ani Björkström',
                style: TextStyle(
                  fontSize: 16, 
                  fontStyle: FontStyle.italic, 
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

