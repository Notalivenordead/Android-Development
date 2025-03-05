import 'island.dart';
import '../utils/random_utils.dart';

abstract class Animal {
  final Island island;
  final String name;
  final double weight;
  final int maxPerCell;
  final int speed;
  final double foodRequired;

  double currentFood = 0;
  int currentX = 0;
  int currentY = 0;
  final Gender gender;

  Animal({
    required this.island,
    required this.name,
    required this.weight,
    required this.maxPerCell,
    required this.speed,
    required this.foodRequired,
    required this.gender,
  });

  void eat(List<dynamic> entities);
  void move(Island island);
  void reproduce();
  void die();

  void live(Island island) {
    eat(island.grid[currentX][currentY]);
    move(island);
    reproduce();
    if (currentFood <= 0) die();
  }
}
