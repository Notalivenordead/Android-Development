import 'dart:async';
import 'dart:collection';

Future<void> task6() async {
  final semaphore = Semaphore(2);

  void accessResource(int threadId) async {
    await semaphore.acquire();
    print('Thread $threadId is accessing the resource.');
    await Future.delayed(Duration(seconds: 2));
    print('Thread $threadId has finished using the resource.');
    semaphore.release();
  }

  final futures = List<Future>.generate(
    5,
    (i) => Future(() => accessResource(i + 1)),
  );

  await Future.wait(futures);
}

class Semaphore {
  final int _maxPermits;
  int _availablePermits;
  final Queue<Completer<void>> _waitingQueue = Queue();

  Semaphore(this._maxPermits) : _availablePermits = _maxPermits;

  Future<void> acquire() async {
    if (_availablePermits > 0) {
      _availablePermits--;
      return;
    }

    final completer = Completer<void>();
    _waitingQueue.add(completer);
    await completer.future;
    _availablePermits--;
  }

  void release() {
    if (_availablePermits < _maxPermits) {
      _availablePermits++;
      if (_waitingQueue.isNotEmpty) {
        final completer = _waitingQueue.removeFirst();
        completer.complete();
      }
    } else {
      print('Warning: Attempt to release more permits than allowed.');
    }
  }
}
