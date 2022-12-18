import 'package:url_launcher/url_launcher.dart';

Future<void> launchThisUrl(String webUrl) async {
  final Uri _url = Uri.parse(webUrl);

  if(!await launchUrl(_url)) {
    throw "Could not launch $_url";
  }
}