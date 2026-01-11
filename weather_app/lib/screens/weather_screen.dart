import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/widgets/additional_forecast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  static const apiKey = "ce361914da9723bbe601e740dbc10f71";
  String city = "vijayawada";
  late TextEditingController cityController;

  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    cityController = TextEditingController(text: city);
    getWeatherDetails();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  String weatherEmoji(int weatherId) {
    if (weatherId >= 200 && weatherId <= 232) {
      return "⛈️"; // Thunderstorm
    } else if (weatherId >= 300 && weatherId <= 321) {
      return "🌦️"; // Drizzle
    } else if (weatherId >= 500 && weatherId <= 504) {
      return "🌧️"; // Rain
    } else if (weatherId == 511) {
      return "🧊🌧️"; // Freezing rain
    } else if (weatherId >= 520 && weatherId <= 531) {
      return "🌦️"; // Shower rain
    } else if (weatherId >= 600 && weatherId <= 622) {
      return "❄️"; // Snow
    } else if (weatherId >= 701 && weatherId <= 781) {
      return "🌫️"; // Fog/Mist/Dust/Smoke
    } else if (weatherId == 800) {
      return "☀️"; // Clear sky
    } else if (weatherId == 801) {
      return "🌤️"; // Few clouds
    } else if (weatherId == 802) {
      return "⛅"; // Scattered clouds
    } else if (weatherId == 803 || weatherId == 804) {
      return "☁️"; // Broken / overcast clouds
    } else {
      return "❓";
    }
  }

  Future<void> getWeatherDetails() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey",
        ),
      );

      final data = jsonDecode(res.body);

      if (res.statusCode != 200) {
        setState(() {
          error = data["message"] ?? "Something went wrong";
          isLoading = false;
        });
        return;
      }

      setState(() {
        weatherData = data;
        isLoading = false;
      });

      // debugPrint("Temp: ${data['main']['temp']}");
      // debugPrint("Condition: ${data['weather'][0]['main']}");
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
            padding: EdgeInsets.all(12),
            
          ),
        ),
      );
    }

    if (error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Weather App")),

        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                side: BorderSide(width: 0.5),
              ),
              child: Text(
                error!,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }

    final double temp = weatherData!["main"]["temp"];
    final String condition = weatherData!["weather"][0]["main"];
    final String emoji = weatherEmoji(weatherData!['weather'][0]['id']);
    final int humidity = weatherData!['main']['humidity'];
    final int pressure = weatherData!['main']['pressure'];
    final double wind = weatherData!['wind']['speed'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: getWeatherDetails,
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        labelText: "Enter City",
                        prefixIcon: Icon(Icons.location_on_rounded),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (cityController.text.isNotEmpty) {
                        setState(() {
                          city = cityController.text;
                        });
                        getWeatherDetails();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      "Get",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 3,
                shadowColor: Colors.blue[700],
                color: Colors.blue,
                // margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 5,
                    children: [
                      Text(
                        city,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${temp.toStringAsFixed(2)}° C",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // const Icon(Icons.cloud, size: 45, color: Colors.white),
                      Text(
                        emoji,
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                      Text(
                        condition,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // const SizedBox(height: 20),
            // const Text(
            //   "Weather Forecast",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
            // const SizedBox(height: 10),

            // // (still static for now)
            // const SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       HourlyForecastWidget(
            //         time: "03:00",
            //         icon: Icons.cloud,
            //         temp: "27°C",
            //       ),
            //       HourlyForecastWidget(
            //         time: "06:00",
            //         icon: Icons.sunny,
            //         temp: "30°C",
            //       ),
            //       HourlyForecastWidget(
            //         time: "09:00",
            //         icon: Icons.cloudy_snowing,
            //         temp: "24°C",
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
            const Text(
              "Additional Forecast",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalForecastWidget(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: humidity.toString(),
                ),
                AdditionalForecastWidget(
                  icon: Icons.air,
                  label: "Wind",
                  value: "$wind km/h",
                ),
                AdditionalForecastWidget(
                  icon: Icons.compress,
                  label: "Pressure",
                  value: "$pressure hPa",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
