import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widgets/button.dart';
import '../widgets/display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        try {
          _result = calculateResult(_input).toString();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  double calculateResult(String input) {
    try {
      GrammarParser parser = GrammarParser();
      Expression expression = parser.parse(input.replaceAll('=', ''));
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);

      // Проверяем, является ли результат бесконечностью (деление на ноль)
      if (result.isInfinite || result.isNaN) {
        throw Exception('Division by zero or invalid operation');
      }

      return result;
    } catch (e) {
      // Перебрасываем исключение для тестов
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Display(text: _input.isEmpty ? '0' : _input),
          Display(text: _result.isNotEmpty ? '=$_result' : ''),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final buttonText = buttons[index];
                return Button(
                  text: buttonText,
                  onPressed: () => _onButtonPressed(buttonText),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];
}