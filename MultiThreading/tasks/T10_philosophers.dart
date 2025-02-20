import 'dart:async';
import 'dart:isolate';

class Philosopher {
  final int id;
  final SendPort leftFork;
  final SendPort rightFork;
  final SendPort exitPort;

  Philosopher(this.id, this.leftFork, this.rightFork, this.exitPort);

  void dine() async {
    print('Философ $id начал думать.');

    while (true) {
      if (await _checkExitSignal()) {
        print('Философ $id завершил обед.');
        break;
      }

      print('Философ $id хочет есть.');

      final leftResponse = await _requestFork(leftFork);
      if (!leftResponse) {
        print('Философ $id не смог взять левую вилку.');
        continue;
      }

      if (await _checkExitSignal()) {
        _releaseFork(leftFork);
        print('Философ $id завершил обед.');
        break;
      }

      final rightResponse = await _requestFork(rightFork);
      if (!rightResponse) {
        print('Философ $id не смог взять правую вилку.');
        _releaseFork(leftFork);
        continue;
      }

      print('Философ $id ест.');
      await Future.delayed(Duration(seconds: 2));

      _releaseFork(leftFork);
      _releaseFork(rightFork);
      print('Философ $id закончил есть.');

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

  Future<bool> _checkExitSignal() async {
    final receivePort = ReceivePort();
    exitPort.send({'action': 'check', 'responsePort': receivePort.sendPort});
    return await receivePort.first as bool;
  }
}

void forkManager(SendPort initialResponsePort) {
  final forks = List<bool>.filled(5, true);
  final receivePort = ReceivePort();

  initialResponsePort.send(receivePort.sendPort);

  receivePort.listen((message) {
    try {
      if (message is! Map ||
          message['action'] == null ||
          message['philosopher'] == null ||
          message['philosopher'] is! int) {
        print('Ошибка: некорректное сообщение ($message)');
        return;
      }

      final action = message['action'];
      final philosopher = message['philosopher'];

      if (philosopher < 0 || philosopher >= forks.length) {
        print('Ошибка: некорректный индекс философа ($philosopher)');
        return;
      }

      final responsePort = message['responsePort'];

      if (action == 'request') {
        if (forks[philosopher]) {
          forks[philosopher] = false;
          responsePort?.send(true);
        } else {
          responsePort?.send(false);
        }
      } else if (action == 'release') {
        forks[philosopher] = true;
      }
    } catch (e) {
      print('Ошибка в forkManager: $e');
    }
  });
}

void exitManager(SendPort initialResponsePort) {
  final receivePort = ReceivePort();
  initialResponsePort.send(receivePort.sendPort);

  bool shouldExit = false;
  Timer(Duration(seconds: 10), () {
    shouldExit = true;
    print('Время истекло. Завершаем обед философов...');
  });

  receivePort.listen((message) {
    try {
      if (message is! Map ||
          message['action'] != 'check' ||
          message['responsePort'] == null) {
        print('Ошибка: некорректное сообщение ($message)');
        return;
      }

      final responsePort = message['responsePort'];
      responsePort.send(shouldExit);
    } catch (e) {
      print('Ошибка в exitManager: $e');
    }
  });
}

Future<void> task10() async {
  print('Начинаем обед философов...');

  final forkPorts = List<SendPort?>.filled(5, null);
  for (int i = 0; i < 5; i++) {
    final receivePort = ReceivePort();
    Isolate.spawn(forkManager, receivePort.sendPort);
    forkPorts[i] = await receivePort.first;
  }

  final exitReceivePort = ReceivePort();
  Isolate.spawn(exitManager, exitReceivePort.sendPort);
  final exitPort = await exitReceivePort.first;

  final philosophers = List<Philosopher>.generate(
    5,
    (i) => Philosopher(i, forkPorts[i]!, forkPorts[(i + 1) % 5]!, exitPort),
  );

  for (final philosopher in philosophers) {
    Isolate.spawn((_) => philosopher.dine(), null);
  }

  await Future.delayed(Duration(seconds: 15));
  print('Обед философов завершён.');
}
