import 'dart:isolate';

int factorial(int n) {
  if (n == 0 || n == 1) return 1;
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}

void computeFactorial(Map<String, dynamic> data) {
  final SendPort sendPort = data['sendPort'];
  final int number = data['number'];

  final int result = factorial(number);

  sendPort.send(result);
}

Future<void> task7() async {
  print("--- Task 7: Processing Results with Multithreading ---");

  final receivePort = ReceivePort();

  final List<Isolate> isolates = [];

  for (int i = 1; i <= 10; i++) {
    final isolate = await Isolate.spawn(
      computeFactorial,
      {'sendPort': receivePort.sendPort, 'number': i},
    );
    isolates.add(isolate);
  }

  final List<int> results = [];
  await for (final result in receivePort) {
    results.add(result);

    if (results.length == 10) {
      break;
    }
  }

  receivePort.close();
  for (final isolate in isolates) {
    isolate.kill();
  }

  for (int i = 0; i < results.length; i++) {
    print("Факториал числа ${i + 1}: ${results[i]}");
  }
}
