import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/app_logo.dart';
import '../../../theme/app_colors.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: AppColors.footerColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(),
            ],
          ),
        ),
        Container(
          color: AppColors.footerColor2,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppLogo(),
            ],
          ),
        ),
      ],
    );
  }
}
