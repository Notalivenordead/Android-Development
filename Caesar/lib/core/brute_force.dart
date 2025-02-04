import '../core/caesar_cipher.dart';

class BruteForce {
  final CaesarCipher cipher = CaesarCipher();

  Future<List<String>> decryptAll(String text, int alphabetSize) async =>
      List.generate(alphabetSize - 1, (i) => cipher.decrypt(text, i + 1));
}
