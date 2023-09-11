import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/temperature.dart';

class RequestApi {
  static Future<Temperature?> getTemperature(city) async {
    const String apiKey = 'b74333a170c0be059c3c9557569bd330';
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'));
      if (response.statusCode == 200) {
        // print(response.body);
        return Temperature.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Temp info');
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
