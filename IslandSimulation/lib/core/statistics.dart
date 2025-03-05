import 'dart:io';
import '../core/island.dart';

class Statistics {
  static void logPopulationStats(Island island) {
    final stats = island.getPopulationStats();
    final output = _formatStatistics(stats);

    // Вывод в консоль
    print(output);

    // Запись в файл
    _writeToFile(output);
  }

  static void logFinalStats(Island island) {
    final stats = island.getPopulationStats();
    final output = _formatStatistics(stats, isFinal: true);

    // Вывод в консоль
    print(output);

    // Запись в файл
    _writeToFile(output);
  }

  static String _formatStatistics(Map<String, int> stats,
      {bool isFinal = false}) {
    final buffer = StringBuffer();

    if (isFinal) {
      buffer.writeln('--- Final Simulation Stats ---');
    } else {
      buffer.writeln('--- Current Population Stats ---');
    }

    buffer.writeln('| Species       | Emoji   | Count |');
    buffer.writeln('|---------------|---------|-------|');

    stats.forEach((name, count) {
      final emoji = getEmojiForSpecies(name); // Получаем эмодзи для вида
      buffer.writeln(
          '| ${name.padRight(13)} | $emoji | ${count.toString().padLeft(5)} |');
    });

    buffer.writeln('---------------------------------');
    return buffer.toString();
  }

  static void _writeToFile(String content) {
    final file = File('../lib/example/simulation_output.txt');
    file.writeAsStringSync(content, mode: FileMode.append);
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
