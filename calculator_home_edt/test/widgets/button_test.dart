import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_home_edt/widgets/button.dart';

void main() {
  group('Button Widget Tests', () {
    testWidgets('Renders button with correct text', (WidgetTester tester) async {
      // Arrange: Создаем виджет с текстом "Test Button"
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              text: 'Test Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Act: Ищем текст на экране
      final textFinder = find.text('Test Button');

      // Assert: Проверяем, что текст отображается
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Calls onPressed callback when tapped', (WidgetTester tester) async {
      // Arrange: Создаем флаг для проверки вызова колбэка
      bool isPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Button(
              text: 'Tap Me',
              onPressed: () {
                isPressed = true; // Устанавливаем флаг при нажатии
              },
            ),
          ),
        ),
      );

      // Act: Нажимаем на кнопку
      await tester.tap(find.text('Tap Me'));
      await tester.pump(); // Обновляем дерево виджетов

      // Assert: Проверяем, что колбэк был вызван
      expect(isPressed, true);
    });
  });
}