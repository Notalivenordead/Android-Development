String formatUrl(String url) {
  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    return 'https://$url';
  }
  return url;
}

bool isValidUrl(String url) {
  return url.isNotEmpty && !(url == 'https://' || url == 'http://');
}