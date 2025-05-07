import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
      size: 25,
      color: Color.fromARGB(255, 225, 43, 43),
    );
  }
}
