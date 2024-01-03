import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final Color buttonColor;

  final String imagePath;
  final VoidCallback onPressed;

  const SocialMediaButton({
    Key? key,
    required this.buttonColor,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: buttonColor,
                width: 1.0,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 32.0,
                height: 32.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
