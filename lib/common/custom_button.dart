import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius:
              BorderRadius.circular(30), // Adjust the borderRadius as needed
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.background,
                )
              : Text(
                  'Send Message',
                  style: GoogleFonts.geologica(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
