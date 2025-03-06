import 'island.dart';
import 'package:synchronized/synchronized.dart';

class Plant {
  final Island island; // Остров, на котором находится растение
  final int x; // Координата X
  final int y; // Координата Y
  final String name; // Название растения
  double weight; // Текущий вес растения
  final double maxWeight; // Максимальный вес растения
  final double growthRate; // Скорость роста за ход

  Plant({
    required this.island,
    required this.x,
    required this.y,
    this.name = 'Plant',
    this.weight = 0.1,
    this.maxWeight = 1,
    this.growthRate = 0.1,
  });

  // Метод роста растения
  void grow() {
    if (weight < maxWeight) {
      weight += growthRate;
      if (weight > maxWeight) weight = maxWeight;
      safePrint('$name grew to $weight kg at ($x, $y)');
    }
  }

  // Метод смерти растения
  void die() {
    safePrint('$name died at ($x, $y)');
    weight = 0;
    island.grid[x][y].remove(this); // Удаляем растение из клетки
  }

  // Метод проверки состояния растения
  void checkState() {
    if (weight <= 0) {
      die();
    }
  }

  @override
  String toString() {
    return '$name (Weight: $weight)';
  }

  static void safePrint(String message) {
    _outputLock.synchronized(() {
      print(message);
    });
  }

  static final Lock _outputLock = Lock(); // Используем Lock из synchronized
}
