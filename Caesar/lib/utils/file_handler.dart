import 'dart:io';

class FileHandler {
  Future<String> readFile(String path) async {
    if (!File(path).existsSync()) throw Exception('File not found: $path');
    return await File(path).readAsString();
  }

  Future<void> writeFile(String path, String content) async {
    await File(path).writeAsString(content);
  }
}
