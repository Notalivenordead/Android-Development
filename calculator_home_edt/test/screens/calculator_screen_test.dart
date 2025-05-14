import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_home_edt/screens/calculator_screen.dart'; // Замените на имя вашего проекта

void main() {
  group('Calculator Logic Tests', () {
    test('Correctly calculates addition', () {
      final calculator = CalculatorScreenState();
      expect(calculator.calculateResult('3+5'), 8);
    });

    test('Correctly calculates subtraction', () {
      final calculator = CalculatorScreenState();
      expect(calculator.calculateResult('10-4'), 6);
    });

    test('Correctly calculates multiplication', () {
      final calculator = CalculatorScreenState();
      expect(calculator.calculateResult('3*7'), 21);
    });

    test('Correctly calculates division', () {
      final calculator = CalculatorScreenState();
      expect(calculator.calculateResult('10/2'), 5);
    });

    test('Handles errors gracefully', () {
      final calculator = CalculatorScreenState();
      expect(() => calculator.calculateResult('10/0'), throwsException);
    });
  });
}