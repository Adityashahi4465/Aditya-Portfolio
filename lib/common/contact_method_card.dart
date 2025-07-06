import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class ContactMethodCard extends StatelessWidget {
  final String contactDetail;
  final String contactType;
  final IconData contactIcon;

  const ContactMethodCard({
    super.key,
    required this.size,
    required this.contactDetail,
    required this.contactType,
    required this.contactIcon,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: 0,
      ),
      width: 350,
      height: ResponsiveLayout.isSmallScreen(context) ? 140 : 186,
      decoration: BoxDecoration(
        color: AppColors.primaryLightDark,
        border: Border.all(
          color: AppColors.greyDark,
          width: 0.6,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyLight.withOpacity(0.02),
            spreadRadius: 2,
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contactDetail,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.geologica(
              textStyle: TextStyle(
                fontSize: ResponsiveLayout.isSmallScreen(context) ? 18 : 26,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: ResponsiveLayout.isSmallScreen(context) ? 24 : 30,
                backgroundColor: AppColors.white,
                child: Center(
                  child: Center(
                    child: Icon(
                      contactIcon,
                      size: ResponsiveLayout.isSmallScreen(context) ? 24 : 28,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveLayout.isSmallScreen(context) ? 16 : 24,
              ),
              Text(
                contactType,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.geologica(
                  textStyle: TextStyle(
                    fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 24,
                    fontWeight: FontWeight.w100,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
