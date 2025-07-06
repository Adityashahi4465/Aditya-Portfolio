import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/app_colors.dart';

class FooterSocialButton extends StatefulWidget {
  final String imagePath;
  final Color buttonColor;
  final VoidCallback onTap;
  const FooterSocialButton({
    Key? key,
    required this.imagePath,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FooterSocialButton> createState() => _FooterSocialButtonState();
}

class _FooterSocialButtonState extends State<FooterSocialButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap, // Corrected: invoke the onTap function
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.brightBorderColor, // Border color
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.all(22.0),
          child: isHovered
              ? Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.brightBorderColor,
                  ),
                  child: Image.asset(
                    widget.imagePath,
                  ),
                )
              : Image.asset(
                  widget.imagePath,
                ),
        ),
      ),
    );
  }
}
