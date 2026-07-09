import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_synthese/services/meteo.services.dart'; // Import your service file here

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => MeteoPageState();
}

class MeteoPageState extends State<MeteoPage> {
  final MeteoService _weatherService = MeteoService();
  final TextEditingController _searchController = TextEditingController();

  List<dynamic>? weatherData;
  bool isLoading = false;
  String currentCity = '';
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Handles initial city passed via arguments or defaults to Casablanca
    if (!_isInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;
      currentCity = args is String ? args : 'Casablanca';
      _searchController.text = currentCity;
      _loadWeather(currentCity);
      _isInitialized = true;
    }
  }

  /// Calls the service and updates UI state asynchronously
  Future<void> _loadWeather(String city) async {
    if (city.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      currentCity = city;
    });

    final data = await _weatherService.fetchWeatherData(city);

    setState(() {
      weatherData = data;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Integrated Search Bar UI Component
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter city name...',
                      prefixIcon: const Icon(Icons.search, color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.orange, width: 2),
                      ),
                    ),
                    onSubmitted: (value) => _loadWeather(value),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _loadWeather(_searchController.text),
                  child: const Text('Search'),
                ),
              ],
            ),
          ),

          // Main Display Area
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : (weatherData == null || weatherData!.isEmpty)
                ? Center(
              child: Text(
                _searchController.text.isEmpty
                    ? "Enter a city to view weather."
                    : "No weather data found for '$currentCity'.",
                style: const TextStyle(fontSize: 16),
              ),
            )
                : ListView.builder(
              itemCount: weatherData!.length,
              itemBuilder: (context, index) {
                final item = weatherData![index];

                final int timestamp = item['dt'] ?? 0;
                final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

                // JSON Parsing Safeguard
                final List? weatherList = item['weather'] as List?;
                final String weatherMain = (weatherList != null && weatherList.isNotEmpty)
                    ? weatherList[0]['main'] ?? 'Clear'
                    : 'Clear';
                final double temp = (item['main']['temp'] as num).toDouble();

                return Card(
                  color: Colors.deepOrangeAccent,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white24,
                              backgroundImage: AssetImage(
                                'images/${weatherMain.toLowerCase()}.png',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    DateFormat('E dd/MM/yyyy').format(date),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${DateFormat('HH:mm').format(date)} | $weatherMain",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${temp.round()} °C",
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
