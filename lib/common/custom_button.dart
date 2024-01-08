

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //  button click logic
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 22,
        ),
        elevation: 0,
        backgroundColor: AppColors.red,
        shape: const StadiumBorder(),
      ),
      child: Text(
        'Send Message',
        style: GoogleFonts.geologica(
          textStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
