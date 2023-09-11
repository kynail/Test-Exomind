import 'package:weather_app/model/weather.dart';

class Temperature {
  final List<Weather> weatherTab;
  final double temp;
  final String name;

  const Temperature({
    required this.weatherTab,
    required this.temp,
    required this.name,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
        weatherTab:
            List.from(json['weather']).map((e) => Weather.fromJson(e)).toList(),
        temp: json['main']['temp'],
        name: json['name']);
  }
}
