class Config {
  // Размеры острова
  static const int islandWidth = 20;
  static const int islandHeight = 10;

  // Длительность такта симуляции (в миллисекундах)
  static const Duration tickDuration = Duration(seconds: 1);

  // Максимальная длительность симуляции (в секундах, для тестовой версии — 20 секунд)
  static const int simulationTimeSeconds = 15;

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

  static final Map<String, int> maxPerCell = {
    'Wolf': 30,
    'Boa': 30,
    'Fox': 30,
    'Bear': 5,
    'Eagle': 20,
    'Horse': 20,
    'Deer': 20,
    'Rabbit': 150,
    'Mouse': 500,
    'Goat': 140,
    'Sheep': 140,
    'Boar': 50,
    'Buffalo': 10,
    'Duck': 200,
    'Caterpillar': 1000,
    'Plant': 200,
  };

  // Вероятности поедания (из таблицы 1)
  static const Map<String, Map<String, double>> eatingProbabilities = {
    'Wolf': {
      'Horse': 10,
      'Deer': 15,
      'Rabbit': 60,
      'Mouse': 80,
      'Goat': 60,
      'Sheep': 70,
      'Boar': 15,
      'Buffalo': 10,
      'Duck': 40,
    },
    'Boa': {
      'Fox': 15,
      'Rabbit': 20,
      'Mouse': 40,
      'Duck': 10,
    },
    'Fox': {
      'Rabbit': 70,
      'Mouse': 90,
      'Duck': 60,
      'Caterpillar': 40,
    },
    'Bear': {
      'Boa': 80,
      'Deer': 80,
      'Rabbit': 80,
      'Mouse': 90,
      'Goat': 70,
      'Sheep': 70,
      'Boar': 50,
      'Duck': 10,
    },
    'Eagle': {
      'Fox': 10,
      'Rabbit': 90,
      'Mouse': 90,
      'Duck': 80,
    },
  };

  // Параметры животных (из таблицы 2)
  static final Map<String, Map<String, dynamic>> animalParams = {
    'Wolf': {
      'weight': 50,
      'maxPerCell': 30,
      'speed': 3,
      'foodRequired': 8,
    },
    'Boa': {
      'weight': 15,
      'maxPerCell': 30,
      'speed': 1,
      'foodRequired': 3,
    },
    'Fox': {
      'weight': 8,
      'maxPerCell': 30,
      'speed': 2,
      'foodRequired': 2,
    },
    'Bear': {
      'weight': 500,
      'maxPerCell': 5,
      'speed': 2,
      'foodRequired': 80,
    },
    'Eagle': {
      'weight': 6,
      'maxPerCell': 20,
      'speed': 3,
      'foodRequired': 1,
    },
    'Horse': {
      'weight': 400,
      'maxPerCell': 20,
      'speed': 4,
      'foodRequired': 60,
    },
    'Deer': {
      'weight': 300,
      'maxPerCell': 20,
      'speed': 4,
      'foodRequired': 50,
    },
    'Rabbit': {
      'weight': 2,
      'maxPerCell': 150,
      'speed': 2,
      'foodRequired': 0.45,
    },
    'Mouse': {
      'weight': 0.05,
      'maxPerCell': 500,
      'speed': 1,
      'foodRequired': 0.01,
    },
    'Goat': {
      'weight': 60,
      'maxPerCell': 140,
      'speed': 3,
      'foodRequired': 10,
    },
    'Sheep': {
      'weight': 70,
      'maxPerCell': 140,
      'speed': 3,
      'foodRequired': 15,
    },
    'Boar': {
      'weight': 400,
      'maxPerCell': 50,
      'speed': 2,
      'foodRequired': 50,
    },
    'Buffalo': {
      'weight': 700,
      'maxPerCell': 10,
      'speed': 3,
      'foodRequired': 100,
    },
    'Duck': {
      'weight': 1,
      'maxPerCell': 200,
      'speed': 4,
      'foodRequired': 0.15,
    },
    'Caterpillar': {
      'weight': 0.01,
      'maxPerCell': 1000,
      'speed': 0,
      'foodRequired': 0,
    },
    'Plant': {
      'weight': 1,
      'maxPerCell': 200,
      'growthRate': 0.1,
    },
  };
}
