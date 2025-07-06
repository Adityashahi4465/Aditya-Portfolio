import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../models/testimonial.dart';
import '../../../theme/app_colors.dart';

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({Key? key, required this.testimonial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ResponsiveLayout.isLargeScreen(context)
          ? const EdgeInsets.only(
              left: 16,
            )
          : null,
      decoration: BoxDecoration(
        color: AppColors.purpleCardColor,
        border: Border(
          top: BorderSide(
            color: AppColors.lightPurpleCardColor,
            width: 2.0,
          ),
          bottom: BorderSide(
            color: AppColors.lightPurpleCardColor,
            width: 2.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testimonial.comment,
              textAlign: ResponsiveLayout.isLargeScreen(context)
                  ? TextAlign.left
                  : TextAlign.center,
              style: TextStyle(
                color: ResponsiveLayout.isLargeScreen(context)
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.8),
                fontWeight: FontWeight.w100,
                fontSize: ResponsiveLayout.isSmallScreen(context)
                    ? 18
                    : ResponsiveLayout.isMediumScreen(context)
                        ? 24
                        : 28,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ResponsiveLayout.isLargeScreen(context)
                ? Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: AppColors.primaryLight,
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          meImagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.014,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            testimonial.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.red,
                            ),
                            maxFontSize: 24,
                            minFontSize: 16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AutoSizeText(
                            testimonial.position,
                            style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              color: AppColors.grey,
                            ),
                            maxFontSize: 18,
                            minFontSize: 16,
                          ),
                        ],
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            testimonial.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                            maxFontSize: 24,
                            minFontSize: 16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AutoSizeText(
                            testimonial.position,
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: AppColors.white.withOpacity(0.7),
                            ),
                            maxFontSize: 18,
                            minFontSize: 16,
                          ),
                        ],
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
