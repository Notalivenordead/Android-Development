import 'dart:math';

enum Gender { male, female }

final Random _random = Random();

// Генерация случайного булевого значения с заданной вероятностью
bool getRandomBool(double probability) {
  return _random.nextDouble() < probability;
}

// Генерация случайного пола
Gender getRandomGender() {
  return _random.nextBool() ? Gender.male : Gender.female;
}

// Генерация случайного направления (вверх, вниз, влево, вправо)
Direction getRandomDirection() {
  final directions = [
    Direction(0, -1), // Вверх
    Direction(0, 1), // Вниз
    Direction(-1, 0), // Влево
    Direction(1, 0), // Вправо
  ];
  return directions[_random.nextInt(directions.length)];
}

// Генерация случайного целого числа в диапазоне [min, max)
int getRandomInt(int min, int max) {
  return _random.nextInt(max - min) + min;
}

class Direction {
  final int dx;
  final int dy;

  Direction(this.dx, this.dy);
}
