// ignore_for_file: unused_import
import 'dart:io';
import 'dart:math';
import 'block1/io_operations.dart' as io;
import 'block1/decorators.dart';
import 'block1/performance_benchmark.dart' as bench;
import 'block1/nio_operations.dart' as nio;
import 'package:intl/date_symbol_data_local.dart';
import 'package:Dart_tasks/block2/datetime_utils.dart' as dt;
import 'package:intl/intl.dart';
import 'block3/singleton.dart';
import 'block3/enums.dart';

// Блок 1: Работа с файлами
Future<void> runBlock1(int task) async {
  switch (task) {
    case 1:
      await File('input.txt').writeAsString('Hello, Dart!\nThis is a test.');
      await io.FileIO.processFile('input.txt', 'output.txt');
      break;
    case 2:
      final processor = ReplaceSpaceDecorator(
        UpperCaseDecorator(TrimDecorator(SimpleTextProcessor())),
      );
      print(processor.process('  Hello World!  ')); // HELLO_WORLD!
      break;
    case 3:
      await bench.PerformanceBenchmark.measureIO('input.txt', 'output_io.txt');
      await bench.PerformanceBenchmark.measureNIO(
          'input.txt', 'output_nio.txt');
      break;
    case 4:
      await nio.NIOFileCopier.copyFile('input.txt', 'copy.txt');
      break;
    default:
      print('Неверный номер задачи для блока 1');
  }
}

// Блок 2: Дата и время
Future<void> runBlock2(int task) async {
  await initializeDateFormatting('ru_RU');
  final now = DateTime.now();

  switch (task) {
    case 1:
      print('Текущая дата: ${dt.DateTimeUtils.formatCurrentDateTime()}');
      break;
    case 2:
      print(dt.DateTimeUtils.compareDates(
          DateTime(2023, 10, 1), DateTime(2023, 10, 30)));
      break;
    case 3:
      print('До Нового года: ${dt.DateTimeUtils.daysToNewYear()} дней');
      break;
    case 4:
      print('2024 високосный? ${dt.DateTimeUtils.isLeapYear(2024)}');
      break;
    case 5:
      print(
          'Выходных в октябре 2023: ${dt.DateTimeUtils.countWeekends(2023, 10)}');
      break;
    case 6:
      dt.DateTimeUtils.measureExecutionTime();
      break;
    case 7:
      print(dt.DateTimeUtils.addDaysToDate('31-12-2023'));
      break;
    case 8:
      print('Время в Москве: ${dt.DateTimeUtils.convertTimeZone()}');
      break;
    case 9:
      print(
          'Возраст: ${dt.DateTimeUtils.calculateAge(DateTime(1990, 5, 15))} лет');
      break;
    case 10:
      dt.DateTimeUtils.printMonthCalendar(2023, 10);
      break;
    case 11:
      print(
          'Случайная дата: ${DateFormat('dd.MM.yyyy').format(dt.DateTimeUtils.randomDateInRange(DateTime(2023, 1, 1), DateTime(2023, 12, 31)))}');
      break;
    case 12:
      print(dt.DateTimeUtils.timeUntilEvent(DateTime(2023, 12, 31)));
      break;
    case 13:
      print(
          'Рабочих часов: ${dt.DateTimeUtils.calculateWorkingHours(DateTime(2023, 10, 1), DateTime(2023, 10, 31))}');
      break;
    case 14:
      print(dt.DateTimeUtils.formatDateWithLocale(now, 'ru_RU'));
      break;
    case 15:
      print(dt.DateTimeUtils.getWeekdayName(now));
      break;
    default:
      print('Неверный номер задачи для блока 2');
  }
}

// Блок 3: Singleton и Enums
void runBlock3(int task) {
  switch (task) {
    case 1:
      final db1 = DatabaseConnection();
      final db2 = DatabaseConnection();
      print("db1 и db2 один объект? ${identical(db1, db2)}");
      db1.connect();
      break;
    case 2:
      final logger1 = Logger();
      final logger2 = Logger();
      logger1.addLog("Первый лог");
      logger2.addLog("Второй лог");
      print("logger1 и logger2 один объект? ${identical(logger1, logger2)}");
      logger1.printLogs();
      break;
    case 3:
      final order = Order();
      order.updateStatus(OrderStatus.IN_PROGRESS);
      order.updateStatus(OrderStatus.DELIVERED);
      try {
        order.updateStatus(OrderStatus.CANCELLED);
      } catch (e) {
        print(e);
      }
      break;
    case 4:
      print(getSeasonName(Season.SUMMER));
      break;
    default:
      print('Неверный номер задачи для блока 3');
  }
}

void main() async {
  int? currentBlock;
  bool exitProgram = false;

  while (!exitProgram) {
    if (currentBlock == null) {
      // Выбор блока
      print('\nДоступные блоки задач:');
      print('1. Работа с файлами (4 задачи)');
      print('2. Дата и время (15 задачи)');
      print('3. Singleton и Enums (4 задачи)');
      print('0 - Выход из программы');
      stdout.write('Выберите номер блока: ');

      final input = int.tryParse(stdin.readLineSync() ?? '');

      switch (input) {
        case 0:
          exitProgram = true;
          break;
        case 1:
        case 2:
        case 3:
          currentBlock = input;
          break;
        default:
          print('Неверный номер блока!');
      }
    } else {
      // Выбор задачи в текущем блоке
      print('\nБлок $currentBlock:');
      printTasksForBlock(currentBlock);
      print('99 - Вернуться к выбору блока');
      print('0 - Выход из программы');
      stdout.write('Выберите номер задачи: ');

      final input = int.tryParse(stdin.readLineSync() ?? '');

      if (input == 0) {
        exitProgram = true;
      } else if (input == 99) {
        currentBlock = null;
      } else {
        print('\n--- Результат выполнения ---');
        try {
          switch (currentBlock) {
            case 1:
              await runBlock1(input!);
              break;
            case 2:
              await runBlock2(input!);
              break;
            case 3:
              runBlock3(input!);
              break;
          }
        } catch (e) {
          print('Ошибка выполнения: $e');
        }
      }
    }
  }
  print('Программа завершена');
}

void printTasksForBlock(int block) {
  final tasks = {
    1: List.generate(4, (i) => i + 1),
    2: List.generate(15, (i) => i + 1),
    3: List.generate(4, (i) => i + 1),
  };

  print('Доступные задачи: ${tasks[block]!.join(', ')}');
}
