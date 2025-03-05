import 'dart:async';

void runInThreadPool(List<Function> tasks) {
  final futures = tasks.map((task) => Future(() => task()));
  Future.wait(futures).then((_) => print('All tasks completed'));
}
