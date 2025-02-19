import 'dart:async';

Future<void> task5() async {
  final futures = <Future>[];

  for (int i = 1; i <= 5; i++) {
    futures.add(Future(() async {
      print('Thread $i is working...');
      await Future.delayed(Duration(seconds: 1));
      print('Thread $i finished its task.');
    }));
  }

  await Future.wait(futures);

  print(
      'All threads have completed their tasks and are moving to the next phase.');
}
