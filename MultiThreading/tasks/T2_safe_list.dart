import 'dart:async';
import 'dart:collection';

Future<void> task2() async {
  final list = ListQueue<int>();

  Future<void> addNumbers(int start, int end) async {
    for (int i = start; i <= end; i++) {
      list.add(i);
    }
  }

  final futures = List<Future>.generate(
    10,
    (i) => Future(() => addNumbers(1, 100)),
  );

  await Future.wait(futures);

  print('Final list length: ${list.length}');
  print('List content: $list');
}
