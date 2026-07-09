import 'dart:convert';
import 'package:http/http.dart' as http;

class MeteoService {
  /// Fetches weather forecast data for a specific city.
  /// Returns a List of dynamic data maps or null if the request fails.
  Future<List<dynamic>?> fetchWeatherData(String city) async {
    // 1. Extract the secret key compiled from your --dart-define compilation setup
    const apiKey = String.fromEnvironment('OPENWEATHER_KEY');

    // 2. FIXED: Point to the API subdomain and append query parameters for city, key, and units
    final String url = 'https://api.openweathermap.org/data/2.5/forecast?q=${Uri.encodeComponent(city)}&APPID=$apiKey&units=metric';
    print("Requesting URL: $url");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        return decodedData['list'] as List<dynamic>?;
      } else {
        print("API Error Status Code: ${response.statusCode}");
        print("API Error Response: ${response.body}");
        return null;
      }
    } catch (err) {
      print("Network Error: $err");
      return null;
    }
  }
}
