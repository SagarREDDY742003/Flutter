import 'package:flutter/material.dart';

class WeatherForecastItem extends StatelessWidget {
  const WeatherForecastItem({super.key});

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
              'Time',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),

            Icon(
              Icons.cloud, 
              size: 34
            ),
            SizedBox(height: 8),

            Text(
              '320', 
              style: TextStyle(
                color: Colors.white
              )
            ),
          ],
        ),
      ),
    );
  }
}
