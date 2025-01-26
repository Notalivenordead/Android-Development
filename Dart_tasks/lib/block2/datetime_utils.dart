import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class DateTimeUtils {
  // Задача 1: Текущая дата и время
  static String formatCurrentDateTime() {
    final now = DateTime.now();
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(now);
  }

  // Задача 2: Сравнение дат
  static String compareDates(DateTime date1, DateTime date2) {
    if (date1.isAfter(date2)) return 'Дата 1 позже Даты 2';
    if (date1.isBefore(date2)) return 'Дата 1 раньше Даты 2';
    return 'Даты равны';
  }

  // Задача 3: Дней до Нового года
  static int daysToNewYear() {
    final now = DateTime.now();
    final newYear = DateTime(now.year + 1, 1, 1);
    return newYear.difference(now).inDays;
  }

  // Задача 4: Високосный год
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  // Задача 5: Выходные в месяце
  static int countWeekends(int year, int month) {
    int weekends = 0;
    final daysInMonth = DateTime(year, month + 1, 0).day;
    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(year, month, day);
      if (date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        weekends++;
      }
    }
    return weekends;
  }

  // Задача 6: Время выполнения метода
  static void measureExecutionTime() {
    final stopwatch = Stopwatch()..start();
    for (var i = 0; i < 1000000; i++) {}
    stopwatch.stop();
    print('Время выполнения: ${stopwatch.elapsedMilliseconds} мс');
  }

  // Задача 7: Форматирование и парсинг даты
  static String addDaysToDate(String dateStr) {
    final date = DateFormat('dd-MM-yyyy').parse(dateStr);
    final newDate = date.add(const Duration(days: 10));
    return DateFormat('yyyy/MM/dd').format(newDate);
  }

// Задача 8: Конвертация часовых поясов
  static String convertTimeZone() {
    tz_data.initializeTimeZones();
    final utcTime = tz.TZDateTime.now(tz.UTC);
    final moscowTime =
        tz.TZDateTime.from(utcTime, tz.getLocation('Europe/Moscow'));
    return DateFormat('HH:mm:ss').format(moscowTime);
  }

  // Задача 9: Возраст по дате рождения
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  // Задача 10: Календарь на месяц
  static void printMonthCalendar(int year, int month) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(year, month, day);
      final isWeekend =
          date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
      print('${date.day}: ${isWeekend ? "выходной" : "рабочий"}');
    }
  }

  // Задача 11: Случайная дата в диапазоне
  static DateTime randomDateInRange(DateTime start, DateTime end) {
    final random =
        DateTime.now().microsecondsSinceEpoch % end.difference(start).inDays;
    return start.add(Duration(days: random));
  }

  // Задача 12: Время до события
  static String timeUntilEvent(DateTime eventDate) {
    final now = DateTime.now();
    final difference = eventDate.difference(now);
    return 'Осталось: ${difference.inHours} ч ${difference.inMinutes % 60} мин';
  }

  // Задача 13: Рабочие часы
  static double calculateWorkingHours(DateTime start, DateTime end) {
    double hours = 0;
    var current = start;
    while (current.isBefore(end)) {
      if (current.weekday != DateTime.saturday &&
          current.weekday != DateTime.sunday) {
        hours += 8; // 8 рабочих часов в день
      }
      current = current.add(const Duration(days: 1));
    }
    return hours;
  }

  // Задача 14: Дата с локалью
  static String formatDateWithLocale(DateTime date, String locale) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  // Задача 15: День недели на русском
  static String getWeekdayName(DateTime date) {
    return DateFormat('EEEE', 'ru_RU').format(date);
  }
}
