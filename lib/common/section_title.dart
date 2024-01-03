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
    return AutoSizeText(
      title,
      minFontSize: 76,
      maxFontSize: 82,
      style:const TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: 1.5,
      ),
    );
  }
}
