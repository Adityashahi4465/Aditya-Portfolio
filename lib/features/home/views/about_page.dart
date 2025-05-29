import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../widgets/bullet_points.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      color: AppColors.primary,
      height: ResponsiveLayout.isSmallScreen(context)
          ? size.height > 600 && size.height < 800
              ? 1300
              : 1430
          : MediaQuery.of(context).size.height * 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          color: AppColors.primaryDark,
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: size.width * 0.04,
          //     ),
          //     SizedBox(
          //       width: size.width * 0.33,
          //       child: const Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           AutoSizeText(
          //             "I Create Products\nNot Just Art",
          //             style: TextStyle(
          //               fontSize: 52,
          //               fontWeight: FontWeight.bold,
          //             ),
          //             maxLines: 2,
          //             minFontSize: 20,
          //             maxFontSize: 52,
          //           ),
          //           SizedBox(
          //             height: 32,
          //           ),
          //           AutoSizeText(
          //             "Hello, I'm Aditya Shahi, a passionate freelance software developer specializing in Flutter, Dart, and Nodejs. With hands-on experience in crafting efficient solutions using frameworks like Flutter, Node js, Firebase, and MySQL, I bring creativity and precision to every project. Whether you need a mobile app or a robust backend, I'm here to turn your ideas into reality. Let's build something amazing together!",
          //             style: TextStyle(
          //               fontWeight: FontWeight.w100,
          //               color: AppColors.greyLight,
          //               letterSpacing: 1,
          //               wordSpacing: 1.5,
          //               height: 1.8,
          //             ),
          //             maxLines:
          //                 8, // Adjust the number of lines based on your layout
          //             minFontSize: 16,
          //             maxFontSize: 18,
          //           ),
          //           SizedBox(
          //             height: 16,
          //           ),
          //           BulletPoints(
          //             text: "Elite Solutions, Competitive Pricing",
          //           ),
          //           BulletPoints(
          //             text: "Distinctive Design, Top-tier Development",
          //           ),
          //           BulletPoints(
          //             text: "Exceptional Quality, Affordable Rates",
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
