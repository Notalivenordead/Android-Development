// ignore_for_file: unused_import

import 'package:intl/date_symbol_data_local.dart';
import 'package:Dart_tasks/block2/datetime_utils.dart' as dt;
import 'package:intl/intl.dart';
import 'block3/singleton.dart';
import 'block3/enums.dart';

void main() async {
  await initializeDateFormatting('ru_RU');

  // Задача 1
  print('Текущая дата: ${dt.DateTimeUtils.formatCurrentDateTime()}');

  // Задача 2
  print(dt.DateTimeUtils.compareDates(
      DateTime(2023, 10, 1), DateTime(2023, 10, 30)));

  // Задача 3
  print('До Нового года: ${dt.DateTimeUtils.daysToNewYear()} дней');

  // Задача 4
  print('2024 високосный? ${dt.DateTimeUtils.isLeapYear(2024)}');

  // Задача 5
  print('Выходных в октябре 2023: ${dt.DateTimeUtils.countWeekends(2023, 10)}');

  // Задача 6
  dt.DateTimeUtils.measureExecutionTime();

  // Задача 7
  print(dt.DateTimeUtils.addDaysToDate('31-12-2023'));

  // Задача 8
  print('Время в Москве: ${dt.DateTimeUtils.convertTimeZone()}');

  // Задача 9
  print('Возраст: ${dt.DateTimeUtils.calculateAge(DateTime(1990, 5, 15))} лет');

  // Задача 10
  dt.DateTimeUtils.printMonthCalendar(2023, 10);

  // Задача 11
  print(
      'Случайная дата: ${DateFormat('dd.MM.yyyy').format(dt.DateTimeUtils.randomDateInRange(DateTime(2023, 1, 1), DateTime(2023, 12, 31)))}');

  // Задача 12
  print(dt.DateTimeUtils.timeUntilEvent(DateTime(2023, 12, 31)));

  // Задача 13
  print(
      'Рабочих часов: ${dt.DateTimeUtils.calculateWorkingHours(DateTime(2023, 10, 1), DateTime(2023, 10, 31))}');

  // Задача 14
  print(dt.DateTimeUtils.formatDateWithLocale(DateTime.now(), 'ru_RU'));

  // Задача 15
  print(dt.DateTimeUtils.getWeekdayName(DateTime.now()));
}

/* Тут для теста 3-блока
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
*/
