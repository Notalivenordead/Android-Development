import 'block3/singleton.dart';
import 'block3/enums.dart';

void main() {
  // Задача 1: Проверка Singleton для БД
  final db1 = DatabaseConnection();
  final db2 = DatabaseConnection();
  print("db1 и db2 один объект? ${identical(db1, db2)}\n"); // true
  db1.connect();

  // Задача 2: Проверка Singleton для логов
  final logger1 = Logger();
  final logger2 = Logger();
  logger1.addLog("Первый лог");
  logger2.addLog("Второй лог");
  print(
      "logger1 и logger2 один объект? ${identical(logger1, logger2)}\n"); // true
  logger1.printLogs();

  print("");

  // Задача 3: Проверка статусов заказа
  final order = Order();
  order.updateStatus(OrderStatus.IN_PROGRESS);
  order.updateStatus(OrderStatus.DELIVERED);
  try {
    order.updateStatus(OrderStatus.CANCELLED); // Ошибка
  } catch (e) {
    print("${e}\n");
  }
  // Задача 4: Проверка сезонов
  print(getSeasonName(Season.SUMMER)); // Лето
}
