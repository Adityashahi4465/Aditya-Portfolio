import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/social_media_button.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/constants.dart';

class SocialMediaButtonsRow extends StatelessWidget {
  const SocialMediaButtonsRow({
    super.key,
  });

  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
        Uri.parse(
          url,
        ),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMediaButton(
          onPressed: () => _launchInBrowser(
            linkedinUrl,
          ),
          buttonColor: const Color.fromARGB(255, 0, 125, 227),
          imagePath: linkedInImagePath,
        ),
        SocialMediaButton(
          onPressed: () {
            _launchInBrowser(
              githubUrl,
            );
          },
          buttonColor: const Color.fromARGB(255, 41, 41, 41),
          imagePath: githubImagePath,
        ),
        SocialMediaButton(
          onPressed: () {
            _launchInBrowser(
              leetCodeUrl,
            );
          },
          buttonColor: const Color.fromARGB(255, 217, 130, 0),
          imagePath: leetcodeImagePath,
        ),
        SocialMediaButton(
          onPressed: () {
            _launchInBrowser(
              instagramUrl,
            );
          },
          buttonColor: const Color.fromARGB(255, 203, 0, 68),
          imagePath: instagramImagePath,
        ),
        SocialMediaButton(
          onPressed: () {
            _launchInBrowser(
              facebookUrl,
            );
          },
          buttonColor: const Color.fromARGB(255, 0, 60, 210),
          imagePath: facebookImagePath,
        ),
      ],
    );
  }
}
