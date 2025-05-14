import 'package:flutter/material.dart';

class UrlInput extends StatelessWidget {
  final Function(String) onUrlSubmitted;

  const UrlInput({super.key, required this.onUrlSubmitted});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Enter URL',
          suffixIcon: IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              onUrlSubmitted(controller.text.trim());
            },
          ),
        ),
        onSubmitted: (value) {
          onUrlSubmitted(controller.text.trim());
        },
      ),
    );
  }
}