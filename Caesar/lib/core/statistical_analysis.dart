import '../core/caesar_cipher.dart';

class StatisticalAnalysis {
  final CaesarCipher cipher = CaesarCipher();

  String decryptWithAnalysis(
      String text, Map<String, double> frequencyMap, int alphabetSize) {
    double maxScore = 0;
    String bestText = '';
    for (int i = 1; i < alphabetSize; i++) {
      final decrypted = cipher.decrypt(text, i);
      final score = _calculateScore(decrypted, frequencyMap);
      if (score > maxScore) {
        maxScore = score;
        bestText = decrypted;
      }
    }
    return bestText;
  }

  double _calculateScore(String text, Map<String, double> frequencyMap) {
    double score = 0;
    for (final char in text.toUpperCase().runes) {
      final letter = String.fromCharCode(char);
      if (frequencyMap.containsKey(letter)) score += frequencyMap[letter]!;
    }
    return score;
  }
}
