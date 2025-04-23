import 'package:flutter/material.dart';

class AdditionalInformationItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const AdditionalInformationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon, 
          size: 34
        ),
        SizedBox(height: 8),
        Text(
          label, 
          style: TextStyle(
            color: Colors.white
          )
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
