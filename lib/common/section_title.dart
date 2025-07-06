import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ResponsiveLayout.isSmallScreen(context) ? 36 : 82,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: 1.5,
      ),
    );
  }
}
