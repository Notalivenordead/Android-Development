// ignore_for_file: unused_import

import 'dart:io';
import 'dart:math';

class PerformanceBenchmark {
  static Future<void> measureIO(String source, String dest) async {
    final stopwatch = Stopwatch()..start();
    try {
      final content = await File(source).readAsString();
      await File(dest).writeAsString(content);
      print('Время IO: ${stopwatch.elapsedMilliseconds} мс');
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  static Future<void> measureNIO(String source, String dest) async {
    final stopwatch = Stopwatch()..start();
    try {
      final input = File(source).openRead();
      final output = File(dest).openWrite();
      await input.pipe(output);
      print('Время NIO: ${stopwatch.elapsedMilliseconds} мс');
    } catch (e) {
      print('Ошибка: $e');
    }
  }
}
