import '../lib/core/island.dart';
import '../lib/core/simulation.dart';
import '../lib/utils/config.dart';
import '../lib/core/statistics.dart';
import 'dart:io';

void main() {
  // Очистка файла перед началом симуляции
  final file = File('../lib/example/simulation_output.txt');
  file.writeAsStringSync('', flush: true);

  // Создаем остров
  final island = Island(width: Config.islandWidth, height: Config.islandHeight);

  // Заселяем остров начальной популяцией
  island.populate();

  Statistics.logPopulationStats(island);

  // Запускаем симуляцию
  print('--- Simulation started ---');
  final simulation =
      Simulation(island: island, tickDuration: Config.tickDuration);
  simulation.start();
}
