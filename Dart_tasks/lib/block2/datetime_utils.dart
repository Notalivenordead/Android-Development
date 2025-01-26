import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'dart:math';

class DateTimeUtils {
  // Задача 1: Текущая дата и время
  static String formatCurrentDateTime() =>
      DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

  // Задача 2: Сравнение дат
  static String compareDates(DateTime date1, DateTime date2) =>
      date1.isAfter(date2)
          ? 'Дата 1 позже Даты 2'
          : date1.isBefore(date2)
              ? 'Дата 1 раньше Даты 2'
              : 'Даты равны';

  // Задача 3: Дней до Нового года
  static int daysToNewYear() =>
      DateTime(DateTime.now().year + 1, 1, 1).difference(DateTime.now()).inDays;

  // Задача 4: Високосный год
  static bool isLeapYear(int year) =>
      (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  // Задача 5: Выходные в месяце
  static int countWeekends(int year, int month) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(daysInMonth, (day) => DateTime(year, month, day + 1))
        .where((date) =>
            date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday)
        .length;
  }

  // Задача 6: Время выполнения метода
  static void measureExecutionTime() {
    final stopwatch = Stopwatch()..start();
    for (var i = 0; i < 1000000; i++) {}
    print('Время выполнения: ${stopwatch
      ..stop()
      ..elapsedMilliseconds} мс');
  }

  // Задача 7: Форматирование и парсинг даты
  static String addDaysToDate(String dateStr) =>
      DateFormat('yyyy/MM/dd').format(DateFormat('dd-MM-yyyy')
          .parse(dateStr)
          .add(const Duration(days: 10)));

  // Задача 8: Конвертация часовых поясов
  static String convertTimeZone() {
    tz_data.initializeTimeZones();
    return DateFormat('HH:mm:ss').format(tz.TZDateTime.from(
        tz.TZDateTime.now(tz.UTC), tz.getLocation('Europe/Moscow')));
  }

  // Задача 9: Возраст по дате рождения
  static int calculateAge(DateTime birthDate) =>
      DateTime.now().year -
      birthDate.year -
      (DateTime.now().isBefore(
              DateTime(DateTime.now().year, birthDate.month, birthDate.day))
          ? 1
          : 0);

  // Задача 10: Календарь на месяц
  static void printMonthCalendar(int year, int month) => Iterable.generate(
      DateTime(year, month + 1, 0).day,
      (i) =>
          i + 1).forEach((day) =>
      print('$day: ${_isWeekend(year, month, day) ? "выходной" : "рабочий"}'));

  static bool _isWeekend(int year, int month, int day) {
    final date = DateTime(year, month, day);
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  // Задача 11: Случайная дата в диапазоне
  static DateTime randomDateInRange(DateTime start, DateTime end) =>
      start.add(Duration(days: Random().nextInt(end.difference(start).inDays)));

  // Задача 12: Время до события
  static String timeUntilEvent(DateTime eventDate) =>
      eventDate.isBefore(DateTime.now())
          ? 'Событие уже прошло'
          : 'Осталось: ${eventDate.difference(DateTime.now()).inHours} ч '
              '${eventDate.difference(DateTime.now()).inMinutes % 60} мин';

  // Задача 13: Рабочие часы
  static double calculateWorkingHours(DateTime start, DateTime end) =>
      List.generate(end.difference(start).inDays + 1,
              (i) => start.add(Duration(days: i)))
          .where((date) =>
              date.weekday != DateTime.saturday &&
              date.weekday != DateTime.sunday)
          .length *
      8.0;

  // Задача 14: Дата с локалью
  static String formatDateWithLocale(DateTime date, String locale) =>
      DateFormat.yMMMMd(locale).format(date);

  // Задача 15: День недели на русском
  static String getWeekdayName(DateTime date) =>
      DateFormat('EEEE', 'ru_RU').format(date);
}
