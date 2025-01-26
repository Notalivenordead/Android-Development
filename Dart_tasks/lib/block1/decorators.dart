abstract class TextProcessor {
  String process(String text);
}

class SimpleTextProcessor implements TextProcessor {
  @override
  String process(String text) => text;
}

class UpperCaseDecorator extends TextProcessor {
  final TextProcessor wrappee;
  UpperCaseDecorator(this.wrappee);
  @override
  String process(String text) => wrappee.process(text).toUpperCase();
}

class TrimDecorator extends TextProcessor {
  final TextProcessor wrappee;
  TrimDecorator(this.wrappee);
  @override
  String process(String text) => wrappee.process(text).trim();
}

class ReplaceSpaceDecorator extends TextProcessor {
  final TextProcessor wrappee;
  ReplaceSpaceDecorator(this.wrappee);
  @override
  String process(String text) => wrappee.process(text).replaceAll(' ', '_');
}
