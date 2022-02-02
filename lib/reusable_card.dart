import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardText, required this.cardColor});

  final Color cardColor;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(5.0, 25.0, 5.0, 20.0),
      padding: const EdgeInsets.all(20.0),
      child: Text(
        cardText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
