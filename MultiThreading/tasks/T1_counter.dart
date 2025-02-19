import 'dart:async';

class Counter {
  int _count = 0;
  final _lock = Object();

  void increment() {
    synchronized(() {
      for (int i = 0; i < 1000; i++) {
        _count++;
      }
    });
  }

  int get count => _count;

  void synchronized(void Function() action) {
    synchronizedLock(_lock, action);
  }
}

void synchronizedLock(Object lock, void Function() action) {
  Lock._synchronized(lock, action);
}

class Lock {
  static void _synchronized(Object lock, void Function() action) {
    action();
  }
}

Future<void> task1() async {
  final counter = Counter();
  final futures =
      List<Future>.generate(5, (_) => Future(() => counter.increment()));
  await Future.wait(futures);
  print('Final counter value: ${counter.count}');
}
