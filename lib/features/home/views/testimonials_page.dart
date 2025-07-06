import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/section_title.dart';
import '../controller/home_controller.dart';
import '../widgets/tesimonial/testimonial_row_widget.dart';

/// A page that displays testimonials.
///
/// This page is responsible for displaying a list of testimonials. It uses a [PageController]
/// to navigate between testimonials. The testimonials are fetched using the [testimonialListProvider]
/// from the [ref] object.
///
/// The page consists of a [SectionHeading] widget, followed by a [TestimonialsRow] widget
/// aligned to the right. The [TestimonialsRow] widget displays the testimonials and provides
/// navigation buttons to move to the next or previous testimonial.

class TestimonialsPage extends ConsumerStatefulWidget {
  const TestimonialsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TestimonialsPageState();
}

class _TestimonialsPageState extends ConsumerState<TestimonialsPage> {
  late PageController _pageController;

  void moveToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
    );
  }

  void moveToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testimonialList = ref.read(testimonialListProvider);
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 22),
      height: MediaQuery.of(context).size.height * 0.94,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeading(
            title: 'Testimonial',
          ),
          const SizedBox(
            height: 50,
          ),
          // Align the Row to the right
          Align(
            alignment: ResponsiveLayout.isLargeScreen(context)
                ? Alignment.centerRight
                : Alignment.center,
            child: TestimonialsRow(
              pageController: _pageController,
              testimonialList: testimonialList,
              moveToNextPage: moveToNextPage,
              moveToPreviousPage: moveToPreviousPage,
              ref: ref,
            ),
          ),
        ],
      ),
    );
  }
}
