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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Transform.scale(
                scale: 1,
                child: Image.asset(
                  serviceNumberShape,
                  width: 250,
                  height: 250,
                ),
              ),
              Positioned(
                top: 90,
                left: 100,
                child: Image.asset(
                  serviceImage,
                  width: 65,
                  height: 65,
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
                AutoSizeText(
                  title,
                  maxFontSize: 48,
                  minFontSize: 44,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  description,
                  maxFontSize: 22,
                  minFontSize: 18,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
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
