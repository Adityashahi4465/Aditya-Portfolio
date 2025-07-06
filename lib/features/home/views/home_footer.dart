import 'package:aditya_portfolio/common/social_media_button.dart';
import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:aditya_portfolio/core/constants/constants.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:aditya_portfolio/credits.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/app_logo.dart';
import '../../../common/custom_text_button.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/services/services.dart';
import '../../../theme/app_colors.dart';
import '../widgets/footer_social_button.dart';

class HomeFooter extends ConsumerWidget {
  const HomeFooter({super.key});

  void _launchInBrowser(String url, WidgetRef ref) {
    ref.read(servicesProvider).launchInBrowser(url);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: AppColors.footerColor,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.07,
          ),
          child: ResponsiveLayout.isSmallScreen(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 12,
                  children: [
                    const Center(
                      child: AppLogo(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextButton(
                          text: 'About',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Blog',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Portfolio',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Contact',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 18,
                      children: [
                        FooterSocialButton(
                          imagePath: linkedInImagePath,
                          buttonColor: const Color.fromARGB(255, 0, 125, 227),
                          onTap: () => _launchInBrowser(
                            linkedinUrl,
                            ref,
                          ),
                        ),
                        FooterSocialButton(
                          imagePath: instagramImagePath,
                          buttonColor: const Color.fromARGB(255, 203, 0, 68),
                          onTap: () => _launchInBrowser(
                            instagramUrl,
                            ref,
                          ),
                        ),
                        FooterSocialButton(
                          imagePath: youtubeImagePath,
                          buttonColor: AppColors.red,
                          onTap: () => _launchInBrowser(
                            youtubeUrl,
                            ref,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          text: 'About',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Blog',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Portfolio',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        CustomTextButton(
                          text: 'Contact',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FooterSocialButton(
                          imagePath: linkedInImagePath,
                          buttonColor: const Color.fromARGB(255, 0, 125, 227),
                          onTap: () => _launchInBrowser(
                            linkedinUrl,
                            ref,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        FooterSocialButton(
                          imagePath: instagramImagePath,
                          buttonColor: const Color.fromARGB(255, 203, 0, 68),
                          onTap: () => _launchInBrowser(
                            instagramUrl,
                            ref,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.016,
                        ),
                        FooterSocialButton(
                          imagePath: youtubeImagePath,
                          buttonColor: AppColors.red,
                          onTap: () => _launchInBrowser(
                            youtubeUrl,
                            ref,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        Container(
          color: AppColors.footerColor2,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: const AutoSizeText(
            '© 2025 Aditya Shahi. All rights reserved',
            style: TextStyle(
              // fontWeight: FontWeigh,
              letterSpacing: 1.5,
              color: AppColors.white,
            ),
            maxFontSize: 22,
            minFontSize: 14,
          ),
        ),
      ],
    );
  }
}
