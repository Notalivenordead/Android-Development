import 'dart:io';

void main() {
  while (true) {
    print("Выберите задачу (1-20) или введите 'exit' или 0 для выхода:");
    String input = stdin.readLineSync()?.trim() ?? "0";

    if (input.toLowerCase() == "exit" || input == "0") {
      print("Выход из программы.");
      break;
    }

    int? choice = int.tryParse(input);
    if (choice == null || choice < 0 || choice > 20) {
      print("Неверный выбор. Пожалуйста, выберите число от 1 до 20.");
      continue;
    }

    switch (choice) {
      case 1:
        task1();
        break;
      case 2:
        task2();
        break;
      case 3:
        task3();
        break;
      case 4:
        task4();
        break;
      case 5:
        task5();
        break;
      case 6:
        task6();
        break;
      case 7:
        task7();
        break;
      case 8:
        task8();
        break;
      case 9:
        task9();
        break;
      case 10:
        task10();
        break;
      case 11:
        task11();
        break;
      case 12:
        task12();
        break;
      case 13:
        task13();
        break;
      case 14:
        task14();
        break;
      case 15:
        task15();
        break;
      case 16:
        task16();
        break;
      case 17:
        task17();
        break;
      case 18:
        task18();
        break;
      case 19:
        task19();
        break;
      case 20:
        task20();
        break;
      default:
        print("Неверный выбор. Пожалуйста, выберите число от 1 до 20.");
    }
  }
}

final task1 = () {
  print("Введите два числа:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try {
    if (a == b) throw Exception("Числа равны.");
    print("Максимум: ${a > b ? a : b}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task2 = () {
  print("Введите делимое и делитель:");
  double a = double.parse(stdin.readLineSync()!);
  double b = double.parse(stdin.readLineSync()!);

  try {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Результат деления: ${a / b}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task3 = () {
  print("Введите строку для конвертации в число:");
  String input = stdin.readLineSync()!;

  try {
    int number = int.parse(input);
    print("Конвертированное число: $number");
  } catch (e) {
    print("Ошибка: Невозможно конвертировать строку в число.");
  }
};

final Null Function() task4 = () {
  print("Введите возраст:");
  int age = int.parse(stdin.readLineSync()!);

  try {
    if (age < 0 || age > 150) throw Exception("Недопустимый возраст.");
    print("Возраст корректен: $age");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task5 = () {
  print("Введите число для нахождения корня:");
  double number = double.parse(stdin.readLineSync()!);

  try {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Корень числа: ${customSqrt(number)}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task6 = () {
  print("Введите число для вычисления факториала:");
  int number = int.parse(stdin.readLineSync()!);

  try {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    int factorial = 1;
    for (int i = 1; i <= number; i++) factorial *= i;
    print("Факториал числа: $factorial");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task7 = () {
  print("Введите элементы массива через пробел:");
  String input = stdin.readLineSync()?.trim() ?? "";

  if (input.isEmpty) {
    print("Ошибка: Ввод пустой.");
    return;
  }

  try {
    List<int> array = input.split(' ').map((element) {
      int? number = int.tryParse(element);
      if (number == null) {
        throw FormatException("Невозможно преобразовать '$element' в число.");
      }
      return number;
    }).toList();

    if (array.contains(0)) {
      throw Exception("Массив содержит нули.");
    }
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task8 = () {
  print("Введите число и степень:");
  String input = stdin.readLineSync()?.trim() ?? "";

  try {
    input = input.replaceAll(',', '.');

    List<String> parts = input.split(' ');
    if (parts.length != 2) {
      throw FormatException("Введите ровно два числа: число и степень.");
    }

    double? number = double.tryParse(parts[0]);
    if (number == null) {
      throw FormatException("Невозможно преобразовать '${parts[0]}' в число.");
    }

    int? exponent = int.tryParse(parts[1]);
    if (exponent == null) {
      throw FormatException(
          "Невозможно преобразовать '${parts[1]}' в степень.");
    }

    if (exponent < 0) throw Exception("Степень не может быть отрицательной.");

    print("Результат: ${number.pow(exponent)}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task9 = () {
  print("Введите строку и количество символов:");
  String input = stdin.readLineSync()!;
  int length = int.parse(stdin.readLineSync()!);

  try {
    if (length > input.length)
      throw Exception("Число символов больше длины строки.");
    print("Обрезанная строка: ${input.substring(0, length)}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task10 = () {
  print("Введите элементы массива через пробел:");
  List<int> array = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  print("Введите элемент для поиска:");
  int target = int.parse(stdin.readLineSync()!);

  try {
    if (!array.contains(target)) throw Exception("Элемент не найден.");
    print("Элемент найден.");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task11 = () {
  print("Введите целое число для конвертации в двоичную систему:");
  int number = int.parse(stdin.readLineSync()!);

  try {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Двоичное представление: ${number.toRadixString(2)}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task12 = () {
  print("Введите два числа для проверки делимости:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Делится ли $a на $b: ${a % b == 0}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task13 = () {
  print("Введите элементы списка через пробел:");
  List<int> list = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  print("Введите индекс элемента:");
  int index = int.parse(stdin.readLineSync()!);

  try {
    if (index < 0 || index >= list.length)
      throw Exception("Индекс выходит за пределы списка.");
    print("Элемент по индексу $index: ${list[index]}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task14 = () {
  print("Введите пароль:");
  String password = stdin.readLineSync()?.trim() ?? "";

  try {
    if (password.length < 10) {
      throw Exception("Пароль должен содержать не менее 10 символов.");
    }

    final uppercaseRegex = RegExp(r'[A-Z]');
    if (uppercaseRegex.allMatches(password).length < 3) {
      throw Exception("Пароль должен содержать не менее 3 заглавных букв.");
    }

    final lowercaseRegex = RegExp(r'[a-z]');
    if (lowercaseRegex.allMatches(password).length < 3) {
      throw Exception("Пароль должен содержать не менее 3 строчных букв.");
    }

    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (specialCharRegex.allMatches(password).length < 2) {
      throw Exception(
          "Пароль должен содержать не менее 2 специальных символов.");
    }

    final digitRegex = RegExp(r'[0-9]');
    if (digitRegex.allMatches(password).length < 2) {
      throw Exception("Пароль должен содержать не менее 2 цифр.");
    }

    print("Пароль принят.");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task15 = () {
  print("Введите дату в формате dd.MM.yyyy:");
  String date = stdin.readLineSync()?.trim() ?? "";

  try {
    List<String> parts = date.split('.');
    if (parts.length != 3) {
      throw FormatException(
          "Некорректный формат даты. Используйте dd.MM.yyyy.");
    }

    int? day = int.tryParse(parts[0]);
    if (day == null) {
      throw FormatException("День должен быть числом.");
    }

    int? month = int.tryParse(parts[1]);
    if (month == null) {
      throw FormatException("Месяц должен быть числом.");
    }

    int? year = int.tryParse(parts[2]);
    if (year == null) {
      throw FormatException("Год должен быть числом.");
    }

    if (month < 1 || month > 12) {
      throw FormatException("Месяц должен быть от 1 до 12.");
    }

    if (day < 1 || day > _daysInMonth(year, month)) {
      throw FormatException(
          "Некорректное количество дней для указанного месяца и года.");
    }

    DateTime parsedDate = DateTime(year, month, day);

    print("Дата корректна: ${parsedDate.toLocal()}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

int _daysInMonth(int year, int month) {
  if (month == 2) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      return 29;
    } else {
      return 28;
    }
  } else if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  } else {
    return 31;
  }
}

final Null Function() task16 = () {
  print("Введите две строки:");
  String a = stdin.readLineSync()!;
  String b = stdin.readLineSync()!;

  try {
    if (a.isEmpty || b.isEmpty) throw Exception("Строка не может быть пустой.");
    print("Результат конкатенации: ${a + b}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task17 = () {
  print("Введите два числа:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Остаток от деления: ${a % b}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task18 = () {
  print("Введите число для нахождения корня:");
  double number = double.parse(stdin.readLineSync()!);

  try {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Корень числа: ${customSqrt(number)}");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task19 = () {
  print("Введите температуру в Цельсиях:");
  double celsius = double.parse(stdin.readLineSync()!);

  try {
    if (celsius < -273.15)
      throw Exception("Температура ниже абсолютного нуля.");
    double fahrenheit = celsius * 9 / 5 + 32;
    print("Температура в Фаренгейтах: $fahrenheit");
  } catch (e) {
    print("Ошибка: $e");
  }
};

final Null Function() task20 = () {
  print("Введите строку:");
  String input = stdin.readLineSync()!;

  try {
    if (input.isEmpty) throw Exception("Строка пустая.");
    print("Строка не пустая.");
  } catch (e) {
    print("Ошибка: $e");
  }
};

double customSqrt(double number) {
  if (number < 0) throw Exception("Число не может быть отрицательным.");
  double low = 0, high = number;
  double mid = (low + high) / 2;
  for (int i = 0; i < 100; i++) {
    if (mid * mid > number)
      high = mid;
    else
      low = mid;
    mid = (low + high) / 2;
  }
  return double.parse(mid.toStringAsFixed(4));
}

extension Power on double {
  double pow(int exponent) {
    double result = 1;
    for (int i = 0; i < exponent; i++) result *= this;
    return result;
  }
}
