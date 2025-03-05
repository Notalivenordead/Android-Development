class Config {
  // Размеры острова
  static const int islandWidth = 20;
  static const int islandHeight = 10;

  // Длительность такта симуляции (в миллисекундах)
  static const Duration tickDuration = Duration(milliseconds: 500);

  // Максимальная длительность симуляции (в секундах, для тестовой версии — 20 секунд)
  static const int simulationTimeSeconds = 5;

  // Начальная популяция животных и растений
  static const Map<String, int> initialPopulation = {
    'Wolf': 10,
    'Boa': 15,
    'Fox': 20,
    'Bear': 5,
    'Eagle': 10,
    'Horse': 30,
    'Deer': 30,
    'Rabbit': 100,
    'Mouse': 200,
    'Goat': 40,
    'Sheep': 40,
    'Boar': 20,
    'Buffalo': 10,
    'Duck': 50,
    'Caterpillar': 100,
    'Plant': 500,
  };

  // Вероятности поедания (из таблицы 1)
  static const Map<String, Map<String, double>> eatingProbabilities = {
    'Wolf': {
      'Deer': 0.15,
      'Rabbit': 0.60,
      'Mouse': 0.80,
      'Goat': 0.60,
      'Sheep': 0.70,
      'Boar': 0.15,
      'Duck': 0.40,
      'Horse': 0.10,
    },
    'Boa': {
      'Fox': 0.15,
      'Rabbit': 0.20,
      'Mouse': 0.40,
      'Duck': 0.10,
    },
    'Fox': {
      'Rabbit': 0.70,
      'Mouse': 0.90,
      'Duck': 0.60,
      'Caterpillar': 0.40,
    },
    'Bear': {
      'Boa': 0.80,
      'Deer': 0.80,
      'Rabbit': 0.80,
      'Mouse': 0.90,
      'Goat': 0.70,
      'Sheep': 0.70,
      'Boar': 0.50,
      'Duck': 0.10,
    },
    'Eagle': {
      'Fox': 0.10,
      'Rabbit': 0.90,
      'Mouse': 0.90,
      'Duck': 0.80,
    },
  };

  // Количество детенышей для каждого вида
  static const Map<String, int> offspringCount = {
    'Wolf': 2,
    'Boa': 3,
    'Fox': 4,
    'Bear': 2,
    'Eagle': 1,
    'Horse': 1,
    'Deer': 1,
    'Rabbit': 5,
    'Mouse': 10,
    'Goat': 2,
    'Sheep': 2,
    'Boar': 4,
    'Buffalo': 1,
    'Duck': 3,
    'Caterpillar': 10,
    'Plant': 0,
  };
}
