import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const WeatherForecastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 29, 130, 212),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),

            Icon(
              icon, 
              size: 34
            ),
            SizedBox(height: 8),

            Text(temperature, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
