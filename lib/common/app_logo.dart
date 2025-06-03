import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../core/constants/assets_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: ResponsiveLayout.isSmallScreen(context) ? 20 : 34,
          backgroundImage: const AssetImage(
            logoImagePath,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "AdyAid",
          style: TextStyle(
            fontSize: ResponsiveLayout.isSmallScreen(context) ? 20 : 36,
          ),
        )
      ],
    );
  }
}
