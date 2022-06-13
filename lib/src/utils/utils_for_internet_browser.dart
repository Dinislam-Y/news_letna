// Package imports:
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchUniversalLink(String url) async {
  if (await launchUrlString(url)) {
    final bool nativeAppLaunch = await launchUrlString(url);

    if (!nativeAppLaunch) {
      await launchUrlString(url);
    }
  }
}
