import 'dart:async';
import 'dart:isolate';

Future<void> task3() async {
  final receivePort = ReceivePort();
  final sendPort = receivePort.sendPort;

  void worker(SendPort sendPort) {
    for (int i = 1; i <= 5; i++) {
      sendPort.send('Task $i executed by ${Isolate.current.hashCode}');
    }
  }

  final isolates = <Isolate>[];

  for (int i = 0; i < 4; i++) {
    final isolate = await Isolate.spawn(worker, sendPort);
    isolates.add(isolate);
  }

  int completedTasks = 0;

  await for (final message in receivePort) {
    print(message);
    completedTasks++;

    if (completedTasks == 20) {
      break;
    }
  }

  receivePort.close();
  for (final isolate in isolates) {
    isolate.kill(priority: Isolate.immediate);
  }
}
