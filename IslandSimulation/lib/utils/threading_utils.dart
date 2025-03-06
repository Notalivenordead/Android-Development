import 'dart:async';
import 'package:pool/pool.dart';

class ThreadingUtils {
  static final Pool _pool = Pool(4); // Пул из 4 потоков

  static Future<void> runInThreadPool(List<Function> tasks) async {
    final futures = <Future>[];

    for (var task in tasks) {
      final pooledTask = _pool.withResource(() => Future(() => task()));
      futures.add(pooledTask);
    }

    await Future.wait(futures);
  }
}
