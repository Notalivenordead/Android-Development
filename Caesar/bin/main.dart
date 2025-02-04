import 'dart:io';
import '../lib/core/caesar_cipher.dart';
import '../lib/utils/file_handler.dart';
import '../lib/core/validator.dart';
import '../lib/core/brute_force.dart';
import '../lib/core/statistical_analysis.dart';

void main() async {
  final cipher = CaesarCipher();
  final fileHandler = FileHandler();
  final validator = Validator();
  final bruteForce = BruteForce();
  final stats = StatisticalAnalysis();

  print(
      'Choose an option:\n1. Encrypt\n2. Decrypt with key\n3. Brute force\n4. Statistical analysis');
  final choice = stdin.readLineSync();

  try {
    switch (choice) {
      case '1':
        await _handleEncryption(fileHandler, cipher, validator);
        break;
      case '2':
        await _handleDecryption(fileHandler, cipher, validator);
        break;
      case '3':
        await _handleBruteForce(fileHandler, bruteForce, validator);
        break;
      case '4':
        await _handleStatisticalAnalysis(fileHandler, stats, validator);
        break;
      default:
        print('Invalid option');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> _handleEncryption(
    FileHandler fileHandler, CaesarCipher cipher, Validator validator) async {
  final inputPath = _getInputPath(validator);
  final outputPath = _getOutputPath();
  final shift = _getShift(validator);

  final text = await fileHandler.readFile(inputPath);
  final encrypted = cipher.encrypt(text, shift);
  await fileHandler.writeFile(outputPath, encrypted);
  print('Encryption complete.');
}

Future<void> _handleDecryption(
    FileHandler fileHandler, CaesarCipher cipher, Validator validator) async {
  final inputPath = _getInputPath(validator);
  final outputPath = _getOutputPath();
  final shift = _getShift(validator);

  final text = await fileHandler.readFile(inputPath);
  final decrypted = cipher.decrypt(text, shift);
  await fileHandler.writeFile(outputPath, decrypted);
  print('Decryption complete.');
}

Future<void> _handleBruteForce(
    FileHandler fileHandler, BruteForce bruteForce, Validator validator) async {
  final inputPath = _getInputPath(validator);
  final outputPath = _getOutputPath();

  final text = await fileHandler.readFile(inputPath);
  final results =
      await bruteForce.decryptAll(text, CaesarCipher.alphabet.length);
  await fileHandler.writeFile(outputPath, results.join('\n'));
  print('Brute force decryption complete.');
}

Future<void> _handleStatisticalAnalysis(FileHandler fileHandler,
    StatisticalAnalysis stats, Validator validator) async {
  final inputPath = _getInputPath(validator);
  final outputPath = _getOutputPath();

  final text = await fileHandler.readFile(inputPath);
  final frequencyMap = {'А': 0.08, 'О': 0.11, 'Е': 0.09};
  final decrypted = stats.decryptWithAnalysis(
      text, frequencyMap, CaesarCipher.alphabet.length);
  await fileHandler.writeFile(outputPath, decrypted);
  print('Statistical analysis decryption complete.');
}

String _getInputPath(Validator validator) {
  print('Enter input file path:');
  final path = stdin.readLineSync()!;
  if (!validator.isValidFile(path)) throw Exception('Invalid input file');
  return path;
}

String _getOutputPath() {
  print('Enter output file path:');
  return stdin.readLineSync()!;
}

int _getShift(Validator validator) {
  print('Enter shift value:');
  final shift = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  if (!validator.isValidKey(shift, CaesarCipher.alphabet.length))
    throw Exception('Invalid shift value');
  return shift;
}
