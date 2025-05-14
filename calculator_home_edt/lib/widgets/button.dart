import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02, // Адаптивная высота
          horizontal: MediaQuery.of(context).size.width * 0.05, // Адаптивная ширина
        ),
        backgroundColor: _getButtonColor(text), // Цвет кнопки зависит от текста
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.05, // Адаптивный размер текста
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }

  Color _getButtonColor(String text) {
    if (text == 'C') {
      return Colors.red; // Кнопка очистки красная
    } else if (['+', '-', '*', '/', '='].contains(text)) {
      return Colors.orange; // Операторы оранжевые
    } else {
      return Colors.grey[800]!; // Цифры серые
    }
  }
}