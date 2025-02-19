import 'dart:async';
import 'dart:isolate';

// Функция для "производителя"
void producer(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(Duration(milliseconds: 500), (timer) {
    if (counter < 10) {
      print('Производитель: добавлено значение $counter');
      sendPort.send(counter); // Отправляем значение в канал
      counter++;
    } else {
      sendPort.send(null); // Отправляем сигнал о завершении
      timer.cancel(); // Останавливаем таймер
    }
  });
}

// Функция для "потребителя"
void consumer(dynamic message) {
  final sendPort = message as SendPort;
  final receivePort = ReceivePort();
  print('Потребитель: начал работу');

  receivePort.listen((message) {
    if (message == null) {
      print('Потребитель: все данные обработаны.');
      receivePort.close(); // Закрываем канал
    } else {
      print('Потребитель: обработано значение $message');
    }
  });

  sendPort.send(receivePort.sendPort);
}

// Главная функция
Future<void> task8() async {
  print('Запуск программы...');

  // Создаем канал для связи между изолятами
  final receivePort = ReceivePort();
  final sendPort = await Isolate.spawn<SendPort>(consumer, receivePort.sendPort)
      .then((_) => receivePort.first);

  // Запускаем "производителя" в отдельном изоляте
  Isolate.spawn<SendPort>(producer, sendPort);

  // Ждем завершения работы программы
  await Future.delayed(Duration(seconds: 6));
  print('Программа завершена.');
}
