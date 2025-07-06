import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final int maxLength;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.maxLines,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      style: GoogleFonts.geologica(
        textStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.white,
          fontWeight: FontWeight.w200,
        ),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.geologica(
          textStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyDark,
            width: 0.6,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyDark,
            width: 0.6,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyDark,
            width: 0.8,
          ),
        ),
      ),
    );
  }
}
