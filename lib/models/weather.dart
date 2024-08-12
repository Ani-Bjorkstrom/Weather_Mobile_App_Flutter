class Weather {
  final String description;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final DateTime date;
  final String icon;
  final String cityName; // Add city name
  final String country;  // Add country code

  Weather({
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.date,
    required this.icon,
    required this.cityName,
    required this.country,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      icon: json['weather'][0]['icon'],
      cityName: json['name'], // Extract city name
      country: json['sys']['country'], // Extract country code
    );
  }
}

