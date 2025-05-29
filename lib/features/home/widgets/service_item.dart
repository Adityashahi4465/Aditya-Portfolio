import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String description;
  final String serviceNumberShape;
  final String serviceImage;

  const ServiceItem({
    Key? key,
    required this.title,
    required this.description,
    required this.serviceNumberShape,
    required this.serviceImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: ResponsiveLayout.isLargeScreen(context)
          ? size.width * 0.4
          : double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Stack(
            children: [
              Transform.scale(
                scale: 1,
                child: Image.asset(
                  serviceNumberShape,
                  width: ResponsiveLayout.isSmallScreen(context) ? 150 : 250,
                  height: ResponsiveLayout.isSmallScreen(context) ? 150 : 250,
                ),
              ),
              Positioned(
                top: ResponsiveLayout.isSmallScreen(context) ? 58 : 90,
                left: ResponsiveLayout.isSmallScreen(context) ? 60 : 100,
                child: Image.asset(
                  serviceImage,
                  width: ResponsiveLayout.isSmallScreen(context) ? 45 : 65,
                  height: ResponsiveLayout.isSmallScreen(context) ? 45 : 65,
                  fit: BoxFit.cover,
                  color: AppColors.darkPurple,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ResponsiveLayout.isSmallScreen(context) ? 24 : 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ResponsiveLayout.isSmallScreen(context) ? 14 : 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
