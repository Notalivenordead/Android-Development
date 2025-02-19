import 'dart:async';
import 'dart:isolate';

Future<void> task9() async {
  final data = List.generate(100, (i) => 100 - i);

  void _sortChunk(List<dynamic> args) {
    final SendPort sendPort = args[0];
    final List<int> chunk = args[1];
    chunk.sort();
    sendPort.send(chunk);
  }

  Future<List<int>> sortChunkInIsolate(List<int> chunk) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_sortChunk, [receivePort.sendPort, chunk]);
    final result = await receivePort.first;
    receivePort.close();
    return result as List<int>;
  }

  final chunkSize = data.length ~/ 4;
  final chunks = [
    data.sublist(0, chunkSize),
    data.sublist(chunkSize, 2 * chunkSize),
    data.sublist(2 * chunkSize, 3 * chunkSize),
    data.sublist(3 * chunkSize),
  ];

  final sortedChunks = await Future.wait(
    chunks.map((chunk) => sortChunkInIsolate(chunk)),
  );

  final sortedData = _mergeSortedChunks(sortedChunks);

  print('Sorted data: $sortedData');
}

List<int> _mergeSortedChunks(List<List<int>> sortedChunks) {
  final result = <int>[];
  final iterators = sortedChunks.map((chunk) => chunk.iterator).toList();

  while (true) {
    int? minValue;

    for (var iterator in iterators) {
      if (iterator.moveNext()) {
        if (minValue == null || iterator.current < minValue) {
          minValue = iterator.current;
        }
      }
    }

    if (minValue == null) break;

    result.add(minValue);
  }

  return result;
}
