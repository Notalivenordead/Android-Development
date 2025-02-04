class CaesarCipher {
  static const String alphabet = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';

  String transform(String text, int shift) {
    final result = StringBuffer();
    final alphabetRunes = alphabet.runes.toList();

    for (final char in text.toUpperCase().runes) {
      final index = alphabetRunes.indexOf(char);
      if (index != -1) {
        int newIndex = (index + shift) % alphabet.length;
        if (newIndex < 0) newIndex += alphabet.length;
        result.write(String.fromCharCode(alphabetRunes[newIndex]));
      } else {
        result.write(String.fromCharCode(char));
      }
    }
    return result.toString();
  }

  String encrypt(String text, int shift) => transform(text, shift);
  String decrypt(String text, int shift) => transform(text, -shift);
}
