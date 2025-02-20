import 'dart:async';
import 'dart:isolate';

class Philosopher {
  final int id;
  final SendPort leftFork;
  final SendPort rightFork;

  Philosopher(this.id, this.leftFork, this.rightFork);

  void dine() async {
    print('Философ $id начал думать.');
    await Future.delayed(Duration(seconds: 1));

    while (true) {
      print('Философ $id хочет есть.');

      // Запрашиваем левую вилку
      final leftResponse = await _requestFork(leftFork);
      if (!leftResponse) {
        print('Философ $id не смог взять левую вилку.');
        continue;
      }

      // Запрашиваем правую вилку
      final rightResponse = await _requestFork(rightFork);
      if (!rightResponse) {
        print('Философ $id не смог взять правую вилку.');
        // Освобождаем левую вилку
        _releaseFork(leftFork);
        continue;
      }

      // Едим
      print('Философ $id ест.');
      await Future.delayed(Duration(seconds: 2));

      // Освобождаем вилки
      _releaseFork(leftFork);
      _releaseFork(rightFork);
      print('Философ $id закончил есть.');

      // Думаем
      print('Философ $id начал думать.');
      await Future.delayed(Duration(seconds: 1));
    }
  }

  Future<bool> _requestFork(SendPort fork) async {
    final receivePort = ReceivePort();
    fork.send({
      'action': 'request',
      'philosopher': id,
      'responsePort': receivePort.sendPort
    });
    return await receivePort.first as bool;
  }

  void _releaseFork(SendPort fork) {
    fork.send({'action': 'release', 'philosopher': id});
  }
}

void forkManager(SendPort initialResponsePort) {
  final forks = List<bool>.filled(5, true); // true = свободна, false = занята
  final receivePort = ReceivePort();

  initialResponsePort.send(receivePort.sendPort);

  receivePort.listen((message) {
    try {
      // Проверяем структуру сообщения
      if (message is! Map ||
          message['action'] == null ||
          message['philosopher'] == null ||
          message['philosopher'] is! int) {
        print('Ошибка: некорректное сообщение ($message)');
        return;
      }

      final action = message['action'];
      final philosopher = message['philosopher'];

      // Проверяем корректность индекса философа
      if (philosopher < 0 || philosopher >= forks.length) {
        print('Ошибка: некорректный индекс философа ($philosopher)');
        return;
      }

      final responsePort = message['responsePort'];

      if (action == 'request') {
        if (forks[philosopher]) {
          forks[philosopher] = false; // Занимаем вилку
          responsePort?.send(true);
        } else {
          responsePort?.send(false);
        }
      } else if (action == 'release') {
        forks[philosopher] = true; // Освобождаем вилку
      }
    } catch (e) {
      print('Ошибка в forkManager: $e');
    }
  });
}

Future<void> task10() async {
  print('Начинаем обед философов...');

  // Создаём каналы для управления вилками
  final forkPorts = List<SendPort?>.filled(5, null);
  for (int i = 0; i < 5; i++) {
    final receivePort = ReceivePort();
    Isolate.spawn(forkManager, receivePort.sendPort);
    forkPorts[i] = await receivePort.first;
  }

  // Создаём философов
  final philosophers = List<Philosopher>.generate(
    5,
    (i) => Philosopher(i, forkPorts[i]!, forkPorts[(i + 1) % 5]!),
  );

  // Запускаем философов
  for (final philosopher in philosophers) {
    Isolate.spawn((_) => philosopher.dine(), null);
  }

  // Ждём завершения программы
  await Future.delayed(Duration(seconds: 30));
  print('Обед философов завершён.');
}
