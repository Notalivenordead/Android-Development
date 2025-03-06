import '../utils/random_utils.dart';
import '../utils/config.dart';
import 'island.dart';

abstract class Animal {
  final Island island;
  final Gender gender;
  final String name;
  double weight;
  double currentFood = 0;
  int currentX = 0;
  int currentY = 0;

  Animal({
    required this.island,
    required this.gender,
    required this.name,
  }) : weight = Config.animalParams[name]?['weight'] ?? 0;

  double get foodRequired => Config.animalParams[name]?['foodRequired'] ?? 0;

  int get maxPerCell => Config.animalParams[name]?['maxPerCell'] ?? 0;

  int get speed => Config.animalParams[name]?['speed'] ?? 0;

  void eat(List<dynamic> entities);

  void reproduce();

  void move();

  void dieIfStarving();

  void live(Island island) {
    eat(island.getEntitiesInCell(this.currentX, this.currentY));
    move();
    reproduce();
    dieIfStarving();
  }

  Animal createOffspring();
}
