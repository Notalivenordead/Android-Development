import 'dart:io';
import 'dart:convert';
import 'island.dart';
import 'dart:math';

class Statistics {
  static void logPopulationStats(Island island) {
    final stats = island.getPopulationStats();
    final timestamp = DateTime.now().toString().split('.')[0]; // Текущее время
    final output = _formatStatistics(stats);

    // Вывод в консоль
    print('$timestamp\n$output');

    // Запись в файл
    _writeToFile('$timestamp\n$output');
  }

  static void logFinalStats(Island island) {
    final stats = island.getPopulationStats();
    final timestamp = DateTime.now().toString().split('.')[0]; // Текущее время
    final output = _formatStatistics(stats, isFinal: true);

    // Вывод в консоль
    print('$timestamp\n$output');

    // Запись в файл
    _writeToFile('$timestamp\n$output');
  }

  static String _formatStatistics(Map<String, int> stats,
      {bool isFinal = false}) {
    final buffer = StringBuffer();

    if (isFinal) {
      buffer.writeln('--- Final Simulation Stats ---');
    } else {
      buffer.writeln('--- Current Population Stats ---');
    }

    // Вычисляем максимальную длину названий видов
    final maxNameLength = stats.keys.map((name) => name.length).reduce(max);

    // Форматируем заголовок
    buffer.writeln('| ${'Species'.padRight(maxNameLength)} | Emoji | Count |');
    buffer.writeln('|-${'-'.padRight(maxNameLength, '-')}|-------|-------|');

    // Форматируем строки
    stats.forEach((name, count) {
      final emoji = getEmojiForSpecies(name);
      buffer.writeln(
          '| ${name.padRight(maxNameLength)} | $emoji | ${count.toString().padLeft(5)} |');
    });

    buffer.writeln('-${'-'.padRight(maxNameLength + 20, '-')}-');
    return buffer.toString();
  }

  static void _writeToFile(String content) {
    final timestamp =
        DateTime.now().toString().replaceAll(':', '-'); // Без двоеточий
    final file = File('../lib/example/simulation_output_$timestamp.txt');
    file.writeAsStringSync(content);
  }

  static void logPopulationStatsAsJson(Island island) {
    final stats = island.getPopulationStats();
    final jsonContent = {
      'timestamp': DateTime.now().toIso8601String(),
      'population': stats,
    };

    // Запись в файл
    final file = File('../lib/example/simulation_stats.json');
    file.writeAsStringSync('${json.encode(jsonContent)}\n',
        mode: FileMode.append);
  }

  static String getEmojiForSpecies(String name) {
    switch (name) {
      case 'Wolf':
        return '🐺';
      case 'Boa':
        return '🐍';
      case 'Fox':
        return '🦊';
      case 'Bear':
        return '🐻';
      case 'Eagle':
        return '🦅';
      case 'Horse':
        return '🐎';
      case 'Deer':
        return '🦌';
      case 'Rabbit':
        return '🐇';
      case 'Mouse':
        return '🐁';
      case 'Goat':
        return '🐐';
      case 'Sheep':
        return '🐑';
      case 'Boar':
        return '🐗';
      case 'Buffalo':
        return '🐃';
      case 'Duck':
        return '🦆';
      case 'Caterpillar':
        return '🐛';
      case 'Plant':
        return '🌱';
      default:
        return '❓';
    }
  }
}
