import 'animal.dart';
import '../core/plant.dart';
import '../utils/random_utils.dart';
import '../core/island.dart';
import '../utils/config.dart';

class Herbivore extends Animal {
  Herbivore({
    required Island island,
    required String name,
    required double weight,
    required int maxPerCell,
    required int speed,
    required double foodRequired,
    required Gender gender,
  }) : super(
          island: island,
          name: name,
          weight: weight,
          maxPerCell: maxPerCell,
          speed: speed,
          foodRequired: foodRequired,
          gender: gender,
        );

  @override
  void eat(List<dynamic> entities) {
    for (var entity in entities) {
      if (entity is Plant && getRandomBool(1.0)) {
        print('$name ate a Plant');
        currentFood += entity.weight;
        entities.remove(entity);
        break;
      }
    }
  }

  @override
  void move(Island island) {
    final direction = getRandomDirection();
    final newX = currentX + direction.dx;
    final newY = currentY + direction.dy;

    if (newX >= 0 && newX < island.width && newY >= 0 && newY < island.height) {
      final newCell = island.grid[newX][newY];
      if (newCell.length < maxPerCell) {
        island.grid[currentX][currentY].remove(this);
        newCell.add(this);
        currentX = newX;
        currentY = newY;
      }
    }
  }

  @override
  void reproduce() {
    final cell = island.grid[currentX][currentY];
    final potentialPartners = cell.whereType<Herbivore>().toList();

    for (var partner in potentialPartners) {
      if (partner != this &&
          gender != partner.gender &&
          currentFood >= foodRequired &&
          partner.currentFood >= partner.foodRequired) {
        print('$name reproduced with ${partner.name}');
        final offspringCount = Config.offspringCount[name] ?? 0;
        for (int i = 0; i < offspringCount; i++) {
          final newHerbivore = Herbivore(
            island: island,
            name: name,
            weight: weight,
            maxPerCell: maxPerCell,
            speed: speed,
            foodRequired: foodRequired,
            gender: getRandomGender(),
          )
            ..currentX = currentX
            ..currentY = currentY;
          cell.add(newHerbivore);
        }
        break;
      }
    }
  }

  @override
  void die() {
    print('$name died');
    island.grid[currentX][currentY].remove(this);
  }
}

class Horse extends Herbivore {
  Horse({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Horse',
          weight: 400,
          maxPerCell: 20,
          speed: 4,
          foodRequired: 60,
          gender: gender,
        );
}

class Deer extends Herbivore {
  Deer({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Deer',
          weight: 300,
          maxPerCell: 20,
          speed: 4,
          foodRequired: 50,
          gender: gender,
        );
}

class Rabbit extends Herbivore {
  Rabbit({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Rabbit',
          weight: 2,
          maxPerCell: 150,
          speed: 2,
          foodRequired: 0.45,
          gender: gender,
        );
}

class Mouse extends Herbivore {
  Mouse({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Mouse',
          weight: 0.05,
          maxPerCell: 500,
          speed: 1,
          foodRequired: 0.01,
          gender: gender,
        );
}

class Goat extends Herbivore {
  Goat({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Goat',
          weight: 60,
          maxPerCell: 140,
          speed: 3,
          foodRequired: 10,
          gender: gender,
        );
}

class Sheep extends Herbivore {
  Sheep({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Sheep',
          weight: 70,
          maxPerCell: 140,
          speed: 3,
          foodRequired: 15,
          gender: gender,
        );
}

class Boar extends Herbivore {
  Boar({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Boar',
          weight: 400,
          maxPerCell: 50,
          speed: 2,
          foodRequired: 50,
          gender: gender,
        );
}

class Buffalo extends Herbivore {
  Buffalo({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Buffalo',
          weight: 700,
          maxPerCell: 10,
          speed: 3,
          foodRequired: 100,
          gender: gender,
        );
}

class Duck extends Herbivore {
  Duck({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Duck',
          weight: 1,
          maxPerCell: 200,
          speed: 4,
          foodRequired: 0.15,
          gender: gender,
        );

  @override
  void eat(List<dynamic> entities) {
    for (var entity in entities) {
      if (entity is Plant && getRandomBool(1.0)) {
        print('$name ate a Plant');
        currentFood += entity.weight;
        entities.remove(entity);
        break;
      } else if (entity is Caterpillar && getRandomBool(0.9)) {
        print('$name ate a Caterpillar');
        currentFood += entity.weight;
        entities.remove(entity);
        break;
      }
    }
  }
}

class Caterpillar extends Herbivore {
  Caterpillar({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Caterpillar',
          weight: 0.01,
          maxPerCell: 1000,
          speed: 0,
          foodRequired: 0,
          gender: gender,
        );
}
