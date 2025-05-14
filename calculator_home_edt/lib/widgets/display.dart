import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;

  const Display({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.black, // Черный фон
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.08, // Адаптивный размер текста
          fontWeight: FontWeight.bold,
          color: Colors.white, // Белый текст
        ),
      ),
    );
  }
}