import 'dart:io';

class Validator {
  bool isValidKey(int key, int maxKey) => key >= 0 && key < maxKey;

  bool isValidFile(String path) => File(path).existsSync();
}
