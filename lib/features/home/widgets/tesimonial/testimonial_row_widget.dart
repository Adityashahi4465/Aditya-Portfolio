import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/testimonial.dart';
import '../../../../theme/app_colors.dart';
import '../tesimonial_card.dart';
import 'page_navigation_button_colum.dart';

/// A row of testimonials displayed in a horizontal scrollable container.
class TestimonialsRow extends StatelessWidget {
  final PageController pageController;
  final List<Testimonial> testimonialList;
  final VoidCallback moveToNextPage;
  final VoidCallback moveToPreviousPage;
  final WidgetRef ref;

  const TestimonialsRow({
    Key? key,
    required this.pageController,
    required this.testimonialList,
    required this.moveToNextPage,
    required this.moveToPreviousPage,
    required this.ref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: ResponsiveLayout.isLargeScreen(context)
          ? MainAxisAlignment.end
          : MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ResponsiveLayout.isLargeScreen(context)
              ? size.width * 0.76
              : size.width * 0.9,
          height: size.height * 0.46,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemBuilder: (context, index) {
              final int pageIndex = index % testimonialList.length;
              final Testimonial testimonial = testimonialList[pageIndex];

              return TestimonialCard(testimonial: testimonial);
            },
          ),
        ),
        if (ResponsiveLayout.isLargeScreen(context))
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightPurpleCardColor,
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
            width: size.width * 0.08,
            height: size.height * 0.46,
            child: PageNavigationButtonsColumn(
              moveToNextPage: moveToNextPage,
              moveToPreviousPage: moveToPreviousPage,
              ref: ref,
            ),
          ),
        Container(
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
          width: size.width * 0.035,
          height: size.height * 0.46,
        ),
      ],
    );
  }
}
