import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BulletPoints extends StatelessWidget {
  final String text;
  const BulletPoints({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red, // You can customize the color
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AutoSizeText(
              text,
              minFontSize: 16,
              maxFontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
