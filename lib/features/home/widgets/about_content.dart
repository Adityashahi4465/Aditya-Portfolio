
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../theme/app_colors.dart';
import 'bullet_points.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: size.width * 0.12,
      child: Row(
        children: [
          Container(
            height: size.height * 0.99,
            width: size.width * 0.33,
            color: AppColors.white,
            padding: const EdgeInsets.all(68.0),
            child: Image.asset(
              meImagePath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          SizedBox(
            width: size.width * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.width * 0.11,
                ),
                const AutoSizeText(
                  "I Create Products\nNot Just Art",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  minFontSize: 20,
                  maxFontSize: 52,
                ),
                const SizedBox(
                  height: 32,
                ),
                const AutoSizeText(
                  "Hello, I'm Aditya Shahi, a passionate freelance software developer specializing in Flutter, Dart, and Nodejs. With hands-on experience in crafting efficient solutions using frameworks like Flutter, Node js, Firebase, and MySQL, I bring creativity and precision to every project. Whether you need a mobile app or a robust backend, I'm here to turn your ideas into reality. Let's build something amazing together!",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: AppColors.greyLight,
                    letterSpacing: 1,
                    wordSpacing: 1.5,
                    height: 1.8,
                  ),
                  maxLines:
                      8, // Adjust the number of lines based on your layout
                  minFontSize: 15,
                  maxFontSize: 17,
                ),
                const SizedBox(
                  height: 16,
                ),
                const BulletPoints(
                  text:
                      "Elite Solutions, Competitive Pricing",
                ),
                const BulletPoints(
                  text:
                      "Distinctive Design, Top-tier Development",
                ),
                const BulletPoints(
                  text:
                      "Exceptional Quality, Affordable Rates",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
