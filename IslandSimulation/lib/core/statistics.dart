import 'dart:io';
import 'island.dart';
import 'dart:math';

class Statistics {
  static void logPopulationStats(Island island) {
    final stats = island.getPopulationStats();
    final timestamp = DateTime.now().toString().split('.')[0];
    final output = _formatStatistics(stats);

    print('$timestamp\n$output');
    _writeToFile('$timestamp\n$output');
  }

  static void logFinalStats(Island island) {
    final stats = island.getPopulationStats();
    final timestamp = DateTime.now().toString().split('.')[0];
    final output = _formatStatistics(stats, isFinal: true);

    print('$timestamp\n$output');
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

    final maxNameLength = stats.keys.map((name) => name.length).reduce(max);

    buffer.writeln('| ${'Species'.padRight(maxNameLength)} | Emoji | Count |');
    buffer.writeln('|-${'-'.padRight(maxNameLength, '-')}|-------|-------|');

    stats.forEach((name, count) {
      final emoji = getEmojiForSpecies(name);
      buffer.writeln(
          '| ${name.padRight(maxNameLength)} | $emoji | ${count.toString().padLeft(5)} |');
    });

    buffer.writeln('-${'-'.padRight(maxNameLength + 20, '-')}-');
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
