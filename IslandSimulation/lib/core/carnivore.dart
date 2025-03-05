import 'animal.dart';
import '../utils/random_utils.dart';
import '../core/island.dart';
import '../utils/config.dart';

class Carnivore extends Animal {
  Carnivore({
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
      if (entity is Animal && entity != this) {
        final probability = Config.eatingProbabilities[name]?[entity.name] ?? 0;
        if (getRandomBool(probability)) {
          print('$name ate a ${entity.name}');
          currentFood += entity.weight;
          entities.remove(entity);
          break;
        }
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
    final potentialPartners = cell.whereType<Carnivore>().toList();

    for (var partner in potentialPartners) {
      if (gender != partner.gender &&
          currentFood >= foodRequired &&
          partner.currentFood >= partner.foodRequired) {
        print('$name reproduced with ${partner.name}');
        final offspringCount = Config.offspringCount[name] ?? 0;
        for (int i = 0; i < offspringCount; i++) {
          final newCarnivore = Carnivore(
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
          cell.add(newCarnivore);
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

class Wolf extends Carnivore {
  Wolf({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Wolf',
          weight: 50,
          maxPerCell: 30,
          speed: 3,
          foodRequired: 8,
          gender: gender,
        );
}

class Boa extends Carnivore {
  Boa({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Boa',
          weight: 15,
          maxPerCell: 30,
          speed: 1,
          foodRequired: 3,
          gender: gender,
        );
}

class Fox extends Carnivore {
  Fox({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Fox',
          weight: 8,
          maxPerCell: 30,
          speed: 2,
          foodRequired: 2,
          gender: gender,
        );
}

class Bear extends Carnivore {
  Bear({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Bear',
          weight: 500,
          maxPerCell: 5,
          speed: 2,
          foodRequired: 80,
          gender: gender,
        );
}

class Eagle extends Carnivore {
  Eagle({required Island island, required Gender gender})
      : super(
          island: island,
          name: 'Eagle',
          weight: 6,
          maxPerCell: 20,
          speed: 3,
          foodRequired: 1,
          gender: gender,
        );
}
