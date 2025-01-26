import 'dart:io';
import 'dart:convert';

class FileIO {
  static Future<void> processFile(String inputPath, String outputPath) async {
    try {
      final inputFile = File(inputPath);
      final outputFile = File(outputPath);

      // Чтение и запись через потоки с буферизацией
      final inputStream = inputFile
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter());

      final outputSink = outputFile.openWrite();

      await for (final line in inputStream) {
        outputSink.writeln(line.toUpperCase());
      }

      await outputSink.close();
      print('Файл успешно обработан.');
    } on FileSystemException catch (e) {
      print('Ошибка файловой системы: ${e.message}');
    } catch (e) {
      print('Неизвестная ошибка: $e');
    }
  }
}
