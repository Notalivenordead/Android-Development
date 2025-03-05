import 'carnivore.dart';
import 'herbivore.dart';
import 'plant.dart';
import '../utils/random_utils.dart';
import '../utils/config.dart';

class Island {
  final List<List<List<dynamic>>> grid;
  final int width;
  final int height;

  Island({required this.width, required this.height})
      : grid = List.generate(
          width,
          (_) => List.generate(height, (_) => <dynamic>[]),
        );

  // Заселение острова начальной популяцией
  void populate() {
    for (var entry in Config.initialPopulation.entries) {
      final name = entry.key;
      final count = entry.value;

      for (int i = 0; i < count; i++) {
        final x = getRandomInt(0, width - 1);
        final y = getRandomInt(0, height - 1);

        if (name == 'Plant') {
          grid[x][y].add(Plant());
        } else if (name == 'Caterpillar') {
          grid[x][y].add(Caterpillar(island: this, gender: getRandomGender()));
        } else if (name == 'Wolf') {
          grid[x][y].add(Wolf(island: this, gender: getRandomGender()));
        } else if (name == 'Boa') {
          grid[x][y].add(Boa(island: this, gender: getRandomGender()));
        } else if (name == 'Fox') {
          grid[x][y].add(Fox(island: this, gender: getRandomGender()));
        } else if (name == 'Bear') {
          grid[x][y].add(Bear(island: this, gender: getRandomGender()));
        } else if (name == 'Eagle') {
          grid[x][y].add(Eagle(island: this, gender: getRandomGender()));
        } else if (name == 'Horse') {
          grid[x][y].add(Horse(island: this, gender: getRandomGender()));
        } else if (name == 'Deer') {
          grid[x][y].add(Deer(island: this, gender: getRandomGender()));
        } else if (name == 'Rabbit') {
          grid[x][y].add(Rabbit(island: this, gender: getRandomGender()));
        } else if (name == 'Mouse') {
          grid[x][y].add(Mouse(island: this, gender: getRandomGender()));
        } else if (name == 'Goat') {
          grid[x][y].add(Goat(island: this, gender: getRandomGender()));
        } else if (name == 'Sheep') {
          grid[x][y].add(Sheep(island: this, gender: getRandomGender()));
        } else if (name == 'Boar') {
          grid[x][y].add(Boar(island: this, gender: getRandomGender()));
        } else if (name == 'Buffalo') {
          grid[x][y].add(Buffalo(island: this, gender: getRandomGender()));
        } else if (name == 'Duck') {
          grid[x][y].add(Duck(island: this, gender: getRandomGender()));
        }
      }
    }
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
}
