import 'dart:async';
import 'island.dart';
import 'animal.dart';
import 'plant.dart';
import 'carnivore.dart';
import 'herbivore.dart';
import '../utils/config.dart';
import '../utils/threading_utils.dart';
import 'statistics.dart'; // Для вывода статистики

class Simulation {
  final Island island;
  final Duration tickDuration;
  final DateTime _startTime;
  final Duration _maxSimulationTime;

  Simulation({required this.island, required this.tickDuration})
      : _startTime = DateTime.now(),
        _maxSimulationTime = Duration(seconds: Config.simulationTimeSeconds);

  void start() {
    Timer.periodic(tickDuration, (timer) {
      final currentTime = DateTime.now();
      final elapsedTime = currentTime.difference(_startTime);

      if (isSimulationOver(island)) {
        print('--- Simulation stopped ---');
        Statistics.logFinalStats(island); // Логируем финальную статистику
        timer.cancel();
        return;
      }

      // Жизненный цикл животных и рост растений
      final tasks = <Function>[];
      for (var row in island.grid) {
        for (var cell in row) {
          for (var entity in cell) {
            tasks.add(() {
              if (entity is Animal) {
                entity.live(island);
              } else if (entity is Plant) {
                entity.grow();
              }
            });
          }
        }
      }
      runInThreadPool(tasks);

      // Вывод статистики каждые 10 секунд
      if (elapsedTime.inSeconds % 10 == 0) {
        Statistics.logPopulationStats(island); // Логируем текущую статистику
      }
    });
  }

  bool isSimulationOver(Island island) {
    final currentTime = DateTime.now();
    final elapsedTime = currentTime.difference(_startTime);

    if (elapsedTime >= _maxSimulationTime) {
      print('Simulation stopped: Time limit reached.');
      return true;
    }

    int totalHerbivores = 0;
    int totalCarnivores = 0;

    for (var row in island.grid) {
      for (var cell in row) {
        for (var entity in cell) {
          if (entity is Animal) {
            if (entity is Herbivore) {
              totalHerbivores++;
            } else if (entity is Carnivore) {
              totalCarnivores++;
            }
          }
        }
      }
    }

    if (totalHerbivores == 0) {
      print('Simulation stopped: All herbivores have died.');
      return true;
    }

    if (totalCarnivores == 0) {
      print('Simulation stopped: All carnivores have died.');
      return true;
    }

    return false;
  }
}
