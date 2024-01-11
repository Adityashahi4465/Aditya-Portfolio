import 'package:flutter/material.dart';

import '../core/constants/assets_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundImage: AssetImage(
            logoImagePath,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          "AdyAid",
          style: TextStyle(
            fontSize: 36,
          ),
        )
      ],
    );
  }
}
