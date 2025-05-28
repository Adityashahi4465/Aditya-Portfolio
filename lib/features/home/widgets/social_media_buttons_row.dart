import 'package:aditya_portfolio/common/small_social_media_button.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/social_media_button.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/constants.dart';
import '../../../core/services/services.dart';
import '../../../theme/app_colors.dart';

class SocialMediaButtonsRow extends ConsumerWidget {
  const SocialMediaButtonsRow({
    super.key,
  });

  void _launchInBrowser(String url, WidgetRef ref) {
    ref.read(servicesProvider).launchInBrowser(url);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: ResponsiveLayout.isSmallScreen(context)
          ? [
              SmallSocialMediaButton(
                onPressed: () => _launchInBrowser(
                  linkedinUrl,
                  ref,
                ),
                buttonColor: const Color.fromARGB(255, 0, 125, 227),
                imagePath: linkedInImagePath,
              ),
              SmallSocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    githubUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 41, 41, 41),
                imagePath: githubImagePath,
              ),
              SmallSocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    leetCodeUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 217, 130, 0),
                imagePath: leetcodeImagePath,
              ),
              SmallSocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    instagramUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 203, 0, 68),
                imagePath: instagramImagePath,
              ),
              SmallSocialMediaButton(
                imagePath: youtubeImagePath,
                buttonColor: AppColors.red,
                onPressed: () {
                  _launchInBrowser(
                    youtubeUrl,
                    ref,
                  );
                },
              ),
              SmallSocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    facebookUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 0, 60, 210),
                imagePath: facebookImagePath,
              ),
            ]
          : [
              SocialMediaButton(
                onPressed: () => _launchInBrowser(
                  linkedinUrl,
                  ref,
                ),
                buttonColor: const Color.fromARGB(255, 0, 125, 227),
                imagePath: linkedInImagePath,
              ),
              SocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    githubUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 41, 41, 41),
                imagePath: githubImagePath,
              ),
              SocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    leetCodeUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 217, 130, 0),
                imagePath: leetcodeImagePath,
              ),
              SocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    instagramUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 203, 0, 68),
                imagePath: instagramImagePath,
              ),
              SocialMediaButton(
                imagePath: youtubeImagePath,
                buttonColor: AppColors.red,
                onPressed: () {
                  _launchInBrowser(
                    youtubeUrl,
                    ref,
                  );
                },
              ),
              SocialMediaButton(
                onPressed: () {
                  _launchInBrowser(
                    facebookUrl,
                    ref,
                  );
                },
                buttonColor: const Color.fromARGB(255, 0, 60, 210),
                imagePath: facebookImagePath,
              ),
            ],
    );
  }
}
