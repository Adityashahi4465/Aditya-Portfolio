import 'package:aditya_portfolio/core/constants/assets_constants.dart';
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
      margin: const EdgeInsets.only(
        left: 16,
      ),
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
            AutoSizeText(
              testimonial.comment,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
              ),
              maxFontSize: 24,
              minFontSize: 22,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
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
                      style: const TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }
}
