import 'dart:io';

class NIOFileCopier {
  static Future<void> copyFile(String source, String dest) async {
    try {
      final input = File(source).openRead();
      final output = File(dest).openWrite();
      await input.pipe(output);
      print('Файл скопирован через NIO.');
    } on FileSystemException catch (e) {
      print('Ошибка копирования: ${e.message}');
    } catch (e) {
      print('Неизвестная ошибка: $e');
    }
  }
}
