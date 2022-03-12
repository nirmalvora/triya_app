import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchURL(String url) async {
    if (url.contains('https') || url.contains('http')) {
      if (!await launch(url)) throw 'Could not launch $url';
    } else {
      var newUrl = 'https://' + url;
      if (!await launch(newUrl)) throw 'Could not launch $newUrl';
    }
  }
}
