import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/social_media_button.dart';
import '../../../core/utils/responsive.dart';
import '../../../theme/app_colors.dart';
import '../widgets/social_media_buttons_row.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height:
          ResponsiveLayout.isSmallScreen(context) ? 400 : size.height * 1.08,
      child: Padding(
        padding: ResponsiveLayout.isSmallScreen(context)
            ? const EdgeInsets.only(bottom: 30, left: 20)
            : const EdgeInsets.only(bottom: 120.0),
        child: Row(
          mainAxisAlignment: ResponsiveLayout.isSmallScreen(context)
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: ResponsiveLayout.isSmallScreen(context)
                      ? size.width * 0.9
                      : ResponsiveLayout.isMediumScreen(context)
                          ? size.width * 0.5
                          : size.width * 0.5,
                  child: AutoSizeText.rich(
                    minFontSize: 20,
                    maxFontSize: 26,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    TextSpan(
                      text: "I'm ",
                      style: TextStyle(
                        fontSize: ResponsiveLayout.isSmallScreen(context)
                            ? 26
                            : ResponsiveLayout.isMediumScreen(context)
                                ? 36
                                : 44,
                      ),
                      children: [
                        TextSpan(
                          text: "Aditya ",
                          style: TextStyle(
                            fontSize: ResponsiveLayout.isSmallScreen(context)
                                ? 26
                                : ResponsiveLayout.isMediumScreen(context)
                                    ? 36
                                    : 44,
                            fontWeight: FontWeight.bold,
                            color: AppColors.red,
                          ),
                        ),
                        TextSpan(
                          text: "Shahi",
                          style: TextStyle(
                            fontSize: ResponsiveLayout.isSmallScreen(context)
                                ? 26
                                : ResponsiveLayout.isMediumScreen(context)
                                    ? 36
                                    : 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ResponsiveLayout.isSmallScreen(context)
                      ? size.width * 0.7
                      : ResponsiveLayout.isMediumScreen(context)
                          ? size.width * 0.6
                          : size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AutoSizeText(
                      "Software Development Engineer",
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: ResponsiveLayout.isSmallScreen(context)
                            ? 18
                            : ResponsiveLayout.isMediumScreen(context)
                                ? 32
                                : 38,
                      ),
                      maxFontSize: 38,
                      minFontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: (!ResponsiveLayout.isSmallScreen(context))
                      ? MediaQuery.of(context).size.width * 0.5
                      : MediaQuery.of(context).size.width * 0.7,
                  child: const SocialMediaButtonsRow(),
                ),
              ],
            ),
            if (!ResponsiveLayout.isSmallScreen(context))
              SizedBox(
                width: MediaQuery.of(context).size.width > 1120
                    ? 240
                    : ResponsiveLayout.isMediumScreen(context)
                        ? 40
                        : 160,
              ),
            if (!ResponsiveLayout.isSmallScreen(context))
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 8,
                backgroundImage: const AssetImage(
                  meImagePath,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
