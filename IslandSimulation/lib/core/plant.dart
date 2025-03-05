class Plant {
  final String name = 'Plant';
  double weight = 1; // Текущий вес растения
  static const double maxWeight = 1; // Максимальный вес растения
  static const double growthRate = 0.1; // Скорость роста за ход

  // Метод роста растения
  void grow() {
    if (weight < maxWeight) {
      weight += growthRate;
      if (weight > maxWeight) weight = maxWeight;
      print('$name grew to $weight kg');
    }
  }

  // Метод смерти растения
  void die() {
    print('$name died');
    weight = 0;
  }

  @override
  String toString() {
    return '$name (Weight: $weight)';
  }
}
