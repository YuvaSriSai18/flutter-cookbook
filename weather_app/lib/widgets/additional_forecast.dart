import 'package:flutter/material.dart';

class AdditionalForecastWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalForecastWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Icon(icon, size: 35),
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
