import 'dart:io';

void main()
{
  while (true)
  {
    print("Выберите задачу (1-20) или введите 'exit' или 0 для выхода:");
    String input = stdin.readLineSync()?.trim() ?? "0";

    if (input.toLowerCase() == "exit" || input == "0")
    {
      print("Выход из программы.");
      break;
    }

    int? choice = int.tryParse(input);
    if (choice == null || choice < 0 || choice > 20) 
    {
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

final task1 = ()
{
  print("Введите два числа:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try
  {
    if (a == b) throw Exception("Числа равны.");
    print("Максимум: ${a > b ? a : b}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task2 = ()
{
  print("Введите делимое и делитель:");
  double a = double.parse(stdin.readLineSync()!);
  double b = double.parse(stdin.readLineSync()!);

  try
  {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Результат деления: ${a / b}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task3 = ()
{
  print("Введите строку для конвертации в число:");
  String input = stdin.readLineSync()!;

  try
  {
    int number = int.parse(input);
    print("Конвертированное число: $number");
  }
  catch (e)
  {
    print("Ошибка: Невозможно конвертировать строку в число.");
  }
};

final task4 = ()
{
  print("Введите возраст:");
  int age = int.parse(stdin.readLineSync()!);

  try
  {
    if (age < 0 || age > 150) throw Exception("Недопустимый возраст.");
    print("Возраст корректен: $age");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task5 = ()
{
  print("Введите число для нахождения корня:");
  double number = double.parse(stdin.readLineSync()!);

  try
  {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Корень числа: ${customSqrt(number)}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task6 = ()
{
  print("Введите число для вычисления факториала:");
  int number = int.parse(stdin.readLineSync()!);

  try
  {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    int factorial = 1;
    for (int i = 1; i <= number; i++) factorial *= i;
    print("Факториал числа: $factorial");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task7 = ()
{
  print("Введите элементы массива через пробел:");
  List<int> array = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  try
  {
    if (array.contains(0)) throw Exception("Массив содержит нули.");
    print("Массив не содержит нулей.");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task8 = ()
{
  print("Введите число и степень:");
  double number = double.parse(stdin.readLineSync()!);
  int exponent = int.parse(stdin.readLineSync()!);

  try
  {
    if (exponent < 0) throw Exception("Степень не может быть отрицательной.");
    print("Результат: ${number.pow(exponent)}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task9 = ()
{
  print("Введите строку и количество символов:");
  String input = stdin.readLineSync()!;
  int length = int.parse(stdin.readLineSync()!);

  try
  {
    if (length > input.length) throw Exception("Число символов больше длины строки.");
    print("Обрезанная строка: ${input.substring(0, length)}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};

final task10 = ()
{
  print("Введите элементы массива через пробел:");
  List<int> array = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  print("Введите элемент для поиска:");
  int target = int.parse(stdin.readLineSync()!);

  try
  {
    if (!array.contains(target)) throw Exception("Элемент не найден.");
    print("Элемент найден.");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};



final task11 = () {
  print("Введите целое число для конвертации в двоичную систему:");
  int number = int.parse(stdin.readLineSync()!);

  try
  {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Двоичное представление: ${number.toRadixString(2)}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task12 = ()
{
  print("Введите два числа для проверки делимости:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try
  {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Делится ли $a на $b: ${a % b == 0}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task13 = ()
{
  print("Введите элементы списка через пробел:");
  List<int> list = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  print("Введите индекс элемента:");
  int index = int.parse(stdin.readLineSync()!);

  try
  {
    if (index < 0 || index >= list.length) throw Exception("Индекс выходит за пределы списка.");
    print("Элемент по индексу $index: ${list[index]}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task14 = () {
  print("Введите пароль:");
  String password = stdin.readLineSync()!;

  try
  {
    if (password.length < 8) throw Exception("Пароль слишком слабый.");
    print("Пароль принят.");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task15 = ()
{
  print("Введите дату в формате dd.MM.yyyy:");
  String date = stdin.readLineSync()!;

  try
  {
    DateTime parsedDate = DateTime.parse(date.split('.').reversed.join('-'));
    print("Дата корректна: ${parsedDate.toLocal()}");
  } catch (e)
  {
    print("Ошибка: Некорректный формат даты.");
  }
};


final task16 = ()
{
  print("Введите две строки:");
  String a = stdin.readLineSync()!;
  String b = stdin.readLineSync()!;

  try
  {
    if (a.isEmpty || b.isEmpty) throw Exception("Строка не может быть пустой.");
    print("Результат конкатенации: ${a + b}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task17 = ()
{
  print("Введите два числа:");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);

  try
  {
    if (b == 0) throw Exception("Деление на ноль недопустимо.");
    print("Остаток от деления: ${a % b}");
  }
  catch (e) 
  {
    print("Ошибка: $e");
  }
};


final task18 = ()
{
  print("Введите число для нахождения корня:");
  double number = double.parse(stdin.readLineSync()!);

  try
  {
    if (number < 0) throw Exception("Число не может быть отрицательным.");
    print("Корень числа: ${customSqrt(number)}");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task19 = ()
{
  print("Введите температуру в Цельсиях:");
  double celsius = double.parse(stdin.readLineSync()!);

  try
  {
    if (celsius < -273.15) throw Exception("Температура ниже абсолютного нуля.");
    double fahrenheit = celsius * 9 / 5 + 32;
    print("Температура в Фаренгейтах: $fahrenheit");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


final task20 = () {
  print("Введите строку:");
  String input = stdin.readLineSync()!;

  try {
    if (input.isEmpty) throw Exception("Строка пустая.");
    print("Строка не пустая.");
  }
  catch (e)
  {
    print("Ошибка: $e");
  }
};


double customSqrt(double number)
{
  if (number < 0) throw Exception("Число не может быть отрицательным.");
  double low = 0, high = number;
  double mid = (low + high) / 2;
  for (int i = 0; i < 100; i++)
  {
    if (mid * mid > number) high = mid;
    else low = mid;
    mid = (low + high) / 2;
  }
  return double.parse(mid.toStringAsFixed(4));
}


extension Power on double
{
  double pow(int exponent)
  {
    double result = 1;
    for (int i = 0; i < exponent; i++) result *= this;
    return result;
  }
}
