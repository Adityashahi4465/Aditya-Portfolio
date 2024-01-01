import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/social_media_button.dart';
import '../../../core/utils/responsive.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const AutoSizeText.rich(
                  maxLines: 2,
                  minFontSize: 20,
                  maxFontSize: 26,
                  TextSpan(
                    text: "I'm ",
                    style: TextStyle(
                      fontSize: 44,
                    ),
                    children: [
                      TextSpan(
                        text: "Aditya ",
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 73, 60),
                        ),
                      ),
                      TextSpan(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialMediaButton(
                      onPressed: () {
                        print("Social button pressed!");
                      },
                      buttonColor: const Color.fromARGB(255, 0, 125, 227),
                      imagePath: 'images/linkedin.png',
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        print("Social button pressed!");
                      },
                      buttonColor: Color.fromARGB(255, 41, 41, 41),
                      imagePath: 'images/github.png',
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        print("Social button pressed!");
                      },
                      buttonColor: const Color.fromARGB(255, 217, 130, 0),
                      imagePath: 'images/leetcode.png',
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        print("Social button pressed!");
                      },
                      buttonColor: Color.fromARGB(255, 203, 0, 68),
                      imagePath: 'images/instagram.png',
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        print("Social button pressed!");
                      },
                      buttonColor: Color.fromARGB(255, 0, 60, 210),
                      imagePath: 'images/facebook.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > 1190
                ? 360
                : ResponsiveLayout.isMediumScreen(context)
                    ? 90
                    : 180,
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
    );
  }
}
