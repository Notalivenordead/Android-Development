import 'dart:async';

Future<void> task11() async {
  final matrixA = [
    [1, 2, 3],
    [4, 5, 6],
  ];
  final matrixB = [
    [7, 8],
    [9, 10],
    [11, 12],
  ];

  Future<List<int>> multiplyRow(int row) async {
    final result = List.filled(matrixB[0].length, 0);
    for (int i = 0; i < matrixB.length; i++) {
      for (int j = 0; j < matrixB[0].length; j++) {
        result[j] += matrixA[row][i] * matrixB[i][j];
      }
    }
    return result;
  }

  final futures = List<Future<List<int>>>.generate(
    matrixA.length,
    (i) => multiplyRow(i),
  );

  final resultMatrix = await Future.wait(futures);

  print('Result matrix: $resultMatrix');
}
