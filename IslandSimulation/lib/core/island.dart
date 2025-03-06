import 'dart:io';
import 'animal.dart';
import 'carnivore.dart';
import 'herbivore.dart';
import 'plant.dart';
import '../utils/random_utils.dart';
import '../utils/config.dart';
import 'package:synchronized/synchronized.dart';

class Island {
  final List<List<List<dynamic>>> grid;
  final int width;
  final int height;

  Island({required this.width, required this.height})
      : grid = List.generate(
          width,
          (_) => List.generate(height, (_) => <dynamic>[]),
        );

  Map<String, int> getPopulationStats() {
    final stats = <String, int>{};

    for (var row in grid) {
      for (var cell in row) {
        for (var entity in cell) {
          stats[entity.name] = (stats[entity.name] ?? 0) + 1;
        }
      }
    }

    return stats;
  }

  List<dynamic> getEntitiesInCell(int x, int y) {
    if (x < 0 || x >= grid.length || y < 0 || y >= grid[0].length) {
      throw ArgumentError('Coordinates out of bounds');
    }
    return grid[x][y];
  }

  // Заселение острова начальной популяцией
  void populate() {
    for (var entry in Config.initialPopulation.entries) {
      final name = entry.key;
      final count = entry.value;

      for (int i = 0; i < count; i++) {
        final x = getRandomInt(0, width - 1);
        final y = getRandomInt(0, height - 1);

        final entity = _createEntity(name, x, y);
        if (entity != null) {
          addEntity(entity, x, y);
        }
      }
    }
  }

  // Создание сущности по имени
  dynamic _createEntity(String name, int x, int y) {
    switch (name) {
      case 'Plant':
        return Plant(island: this, x: x, y: y);
      case 'Caterpillar':
        return Caterpillar(island: this, gender: getRandomGender());
      case 'Wolf':
        return Wolf(island: this, gender: getRandomGender());
      case 'Boa':
        return Boa(island: this, gender: getRandomGender());
      case 'Fox':
        return Fox(island: this, gender: getRandomGender());
      case 'Bear':
        return Bear(island: this, gender: getRandomGender());
      case 'Eagle':
        return Eagle(island: this, gender: getRandomGender());
      case 'Horse':
        return Horse(island: this, gender: getRandomGender());
      case 'Deer':
        return Deer(island: this, gender: getRandomGender());
      case 'Rabbit':
        return Rabbit(island: this, gender: getRandomGender());
      case 'Mouse':
        return Mouse(island: this, gender: getRandomGender());
      case 'Goat':
        return Goat(island: this, gender: getRandomGender());
      case 'Sheep':
        return Sheep(island: this, gender: getRandomGender());
      case 'Boar':
        return Boar(island: this, gender: getRandomGender());
      case 'Buffalo':
        return Buffalo(island: this, gender: getRandomGender());
      case 'Duck':
        return Duck(island: this, gender: getRandomGender());
      default:
        return null;
    }
  }

  // Добавление сущности в клетку
  void addEntity(dynamic entity, int x, int y) {
    final cell = grid[x][y];
    final maxPerCell = Config.maxPerCell[entity.runtimeType.toString()] ?? 0;

    if (cell.whereType<dynamic>().length < maxPerCell) {
      cell.add(entity);
    }

    // Метод роста растений
    void growPlants() {
      for (var row in grid) {
        for (var cell in row) {
          for (var entity in cell) {
            if (entity is Plant) {
              entity.grow();
            }
          }
        }
      }
    }

    // Метод жизненного цикла животных
    void simulateLifeCycle() {
      final lock = Lock();

      for (var row in grid) {
        for (var cell in row) {
          for (var entity in cell) {
            if (entity is Animal) {
              lock.synchronized(() {
                entity.eat(cell);
                entity.move();
                entity.reproduce();
                entity.dieIfStarving();
              });
            }
          }
        }
      }
    }

    // Получение статистики по популяции
    Map<String, int> getPopulationStats() {
      final stats = <String, int>{};

      for (var row in grid) {
        for (var cell in row) {
          for (var entity in cell) {
            stats[entity.name] = (stats[entity.name] ?? 0) + 1;
          }
        }
      }

      return stats;
    }

    // Вывод статистики в консоль
    void printStats() {
      final stats = getPopulationStats();
      print('--- Population Stats ---');
      stats.forEach((name, count) {
        print('$name: $count');
      });
      print('------------------------');
    }

    // Основной метод симуляции
    void simulate() {
      final simulationDuration =
          Duration(seconds: Config.simulationTimeSeconds);
      final tickDuration = Config.tickDuration;

      final stopwatch = Stopwatch()..start();

      while (stopwatch.elapsed < simulationDuration) {
        growPlants();
        simulateLifeCycle();
        printStats();

        // Ждем до следующего такта
        sleep(tickDuration);
      }

      print('Simulation ended.');
    }
  }
}
