import 'dart:async';
import 'dart:isolate';

void timerTask(SendPort sendPort) {
  int seconds = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    seconds++;
    print('Timer: $seconds seconds');
    if (seconds >= 10) {
      print('Stopping timer...');
      timer.cancel();
      sendPort.send('Timer completed');
    }
  });
}

Future<void> task12() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(timerTask, receivePort.sendPort);
  await receivePort.first;
  print('Main thread received completion signal.');
}
