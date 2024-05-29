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
      height: size.height * 1.08,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 120.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText.rich(
                    maxLines: 2,
                    minFontSize: 20,
                    maxFontSize: 26,
                    TextSpan(
                      text: "I'm ",
                      style: const TextStyle(
                        fontSize: 44,
                      ),
                      children: [
                        TextSpan(
                          text: "Aditya ",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: AppColors.red,
                          ),
                        ),
                        const TextSpan(
                          text: "Shahi",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: AutoSizeText(
                      "Freelance Software Developer",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w100,
                      ),
                      maxFontSize: 38,
                      minFontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SocialMediaButtonsRow(),
                ],
              ),
            ),
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
