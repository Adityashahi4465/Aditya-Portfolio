import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final servicesProvider = Provider<Services>((ref) {
  return Services();
});

class Services {
  Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(
        url,
      ),
      mode:
          kIsWeb ? LaunchMode.externalApplication : LaunchMode.inAppBrowserView,
    )) {
      throw 'Could not launch $url';
    }
  }
}
