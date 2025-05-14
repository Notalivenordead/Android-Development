import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/url_input.dart';
import '../utils/webview_helper.dart';

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({super.key});

  @override
  BrowserScreenState createState() => BrowserScreenState();
}

class BrowserScreenState extends State<BrowserScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Инициализация WebView происходит автоматически
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Browser'),
      ),
      body: Column(
        children: [
          UrlInput(
            onUrlSubmitted: (url) {
              _loadUrl(url);
            },
          ),
          Expanded(
            child: WebViewWidget(
              controller: _controller = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onPageStarted: (String url) {
                      debugPrint('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                      debugPrint('Page finished loading: $url');
                    },
                    onWebResourceError: (WebResourceError error) {
                      debugPrint('Error loading page: ${error.description}');
                    },
                  ),
                )
                ..loadRequest(Uri.parse('https://flutter.dev'))
                ..enableZoom(true),
            ),
          ),
        ],
      ),
    );
  }

  void _loadUrl(String url) {
    try {
      final formattedUrl = formatUrl(url); // Форматируем URL
      if (!isValidUrl(formattedUrl)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid URL. Please enter a valid website address.')),
        );
        return;
      }
      _controller.loadRequest(Uri.parse(formattedUrl)); // Загружаем URL
    } catch (e) {
      debugPrint("Failed to load URL: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load URL: $e')),
      );
    }
  }
}