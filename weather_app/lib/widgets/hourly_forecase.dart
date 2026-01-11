import 'package:flutter/material.dart';

class HourlyForecastWidget extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const HourlyForecastWidget({
    super.key,
    required this.time,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        elevation: 2,
        color: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Icon(icon, size: 40),
              const SizedBox(height: 10),
              Text(temp, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
