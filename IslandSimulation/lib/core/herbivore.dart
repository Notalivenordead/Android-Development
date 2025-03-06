import 'animal.dart';
import 'plant.dart';
import '../utils/random_utils.dart';
import 'island.dart';
import '../utils/config.dart';
import 'package:synchronized/synchronized.dart';

abstract class Herbivore extends Animal {
  Herbivore({
    required Island island,
    required Gender gender,
    required String name,
  }) : super(island: island, gender: gender, name: name);

  @override
  void eat(List<dynamic> entities) {
    for (var entity in entities) {
      if (entity is Plant) {
        safePrint('$name ate a Plant');
        currentFood += entity.weight;
        entities.remove(entity);
        break;
      }
    }

    // Утки едят гусениц
    if (runtimeType == Duck) {
      for (var entity in entities) {
        if (entity is Caterpillar) {
          safePrint('$name ate a Caterpillar');
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
        safePrint('$name reproduced with ${partner.name}');
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
      safePrint('$name died of starvation');
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

class Horse extends Herbivore {
  Horse({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Horse',
        );

  @override
  Horse createOffspring() {
    return Horse(island: island, gender: getRandomGender());
  }
}

class Deer extends Herbivore {
  Deer({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Deer',
        );

  @override
  Deer createOffspring() {
    return Deer(island: island, gender: getRandomGender());
  }
}

class Rabbit extends Herbivore {
  Rabbit({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Rabbit',
        );

  @override
  Rabbit createOffspring() {
    return Rabbit(island: island, gender: getRandomGender());
  }
}

class Mouse extends Herbivore {
  Mouse({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Mouse',
        );

  @override
  Mouse createOffspring() {
    return Mouse(island: island, gender: getRandomGender());
  }
}

class Goat extends Herbivore {
  Goat({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Goat',
        );

  @override
  Goat createOffspring() {
    return Goat(island: island, gender: getRandomGender());
  }
}

class Sheep extends Herbivore {
  Sheep({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Sheep',
        );

  @override
  Sheep createOffspring() {
    return Sheep(island: island, gender: getRandomGender());
  }
}

class Boar extends Herbivore {
  Boar({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Boar',
        );

  @override
  Boar createOffspring() {
    return Boar(island: island, gender: getRandomGender());
  }
}

class Buffalo extends Herbivore {
  Buffalo({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Buffalo',
        );

  @override
  Buffalo createOffspring() {
    return Buffalo(island: island, gender: getRandomGender());
  }
}

class Duck extends Herbivore {
  Duck({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Duck',
        );

  @override
  Duck createOffspring() {
    return Duck(island: island, gender: getRandomGender());
  }

  @override
  void eat(List<dynamic> entities) {
    super.eat(entities);

    // Утки едят гусениц
    for (var entity in entities) {
      if (entity is Caterpillar) {
        Herbivore.safePrint('$name ate a Caterpillar');
        currentFood += entity.weight;
        entities.remove(entity);
        break;
      }
    }
  }
}

class Caterpillar extends Herbivore {
  Caterpillar({
    required Island island,
    required Gender gender,
  }) : super(
          island: island,
          gender: gender,
          name: 'Caterpillar',
        );

  @override
  Caterpillar createOffspring() {
    return Caterpillar(island: island, gender: getRandomGender());
  }
}
