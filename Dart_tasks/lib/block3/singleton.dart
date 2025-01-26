// Singleton для подключения к БД (Задача 1)
class DatabaseConnection {
  DatabaseConnection._internal() {
    print("Создано подключение к БД");
  }

  static final DatabaseConnection _instance = DatabaseConnection._internal();
  factory DatabaseConnection() => _instance;
  void connect() => print("Подключение активно");
}

// Singleton для системы логирования (Задача 2)
class Logger {
  final List<String> _logs = [];

  Logger._internal();
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;

  void addLog(String message) => _logs.add("${DateTime.now()}: $message");

  void printLogs() {
    print("История логов:");
    _logs.forEach(print);
  }
}
