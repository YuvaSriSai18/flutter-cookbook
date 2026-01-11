import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/additional_forecast.dart';
import 'package:weather_app/widgets/hourly_forecase.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                ),

                elevation: 3,
                shadowColor: Colors.blue[700],
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "300.64°C",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Icon(Icons.cloud, size: 45),
                        SizedBox(height: 8),
                        Text(
                          "Rain",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Weather Forecast",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastWidget(
                    time: "03:00",
                    icon: Icons.cloud,
                    temp: "27°C",
                  ),
                  HourlyForecastWidget(
                    time: "06:00",
                    icon: Icons.sunny,
                    temp: "30°C",
                  ),
                  HourlyForecastWidget(
                    time: "09:00",
                    icon: Icons.cloudy_snowing,
                    temp: "24°C",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Additional Forecast",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalForecastWidget(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94%",
                ),
                AdditionalForecastWidget(
                  icon: Icons.air,
                  label: "Wind",
                  value: "12 km/h",
                ),
                AdditionalForecastWidget(
                  icon: Icons.compress,
                  label: "Pressure",
                  value: "1013 hPa",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
