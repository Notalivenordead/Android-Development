import 'animal.dart';
import '../utils/random_utils.dart';
import 'island.dart';
import '../utils/config.dart';
import 'package:synchronized/synchronized.dart';

abstract class Carnivore extends Animal {
  Carnivore({
    required Island island,
    required Gender gender,
    required String name,
  }) : super(island: island, gender: gender, name: name);

  @override
  void eat(List<dynamic> entities) {
    for (var entity in entities) {
      if (entity is Animal && entity.runtimeType != runtimeType) {
        final probability = Config.eatingProbabilities[name]?[entity.name] ?? 0;
        if (getRandomBool(probability / 100)) {
          //safePrint('$name ate ${entity.name}');
          currentFood += entity.weight;
          entities.remove(entity);
          break;
        }
      }
    }
  }

  @override
  void reproduce() {
    final cell = island.grid[currentX][currentY];
    final potentialPartners = cell.whereType<Animal>().where((entity) =>
        entity.runtimeType == runtimeType &&
        entity.gender != gender &&
        entity.currentFood >= foodRequired);

    for (var partner in potentialPartners) {
      if (currentFood >= foodRequired) {
        //safePrint('$name reproduced with ${partner.name}');
        final offspringCount = Config.initialPopulation[name] ?? 0;
        for (int i = 0; i < offspringCount; i++) {
          final newEntity = createOffspring()
            ..currentX = currentX
            ..currentY = currentY;
          island.addEntity(newEntity, currentX, currentY);
        }
        break;
      }
    }
  }

  @override
  void move() {
    final direction = getRandomDirection();
    final newX = currentX + direction.dx;
    final newY = currentY + direction.dy;

    if (newX >= 0 && newX < island.width && newY >= 0 && newY < island.height) {
      island.grid[currentX][currentY].remove(this);
      currentX = newX;
      currentY = newY;
      island.grid[currentX][currentY].add(this);
    }
  }

  @override
  void dieIfStarving() {
    if (currentFood <= 0) {
      //safePrint('$name died of starvation');
      island.grid[currentX][currentY].remove(this);
    }
  }

  static void safePrint(String message) {
    _outputLock.synchronized(() {
      print(message);
    });
  }

  static final Lock _outputLock = Lock();
}

class Wolf extends Carnivore {
  Wolf({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Wolf',
        );

  @override
  Wolf createOffspring() {
    return Wolf(island: island, gender: getRandomGender());
  }
}

class Boa extends Carnivore {
  Boa({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Boa',
        );

  @override
  Boa createOffspring() {
    return Boa(island: island, gender: getRandomGender());
  }
}

class Fox extends Carnivore {
  Fox({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Fox',
        );

  @override
  Fox createOffspring() {
    return Fox(island: island, gender: getRandomGender());
  }
}

class Bear extends Carnivore {
  Bear({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Bear',
        );

  @override
  Bear createOffspring() {
    return Bear(island: island, gender: getRandomGender());
  }
}

class Eagle extends Carnivore {
  Eagle({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Eagle',
        );

  @override
  Eagle createOffspring() {
    return Eagle(island: island, gender: getRandomGender());
  }
}
