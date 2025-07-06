import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/home_controller.dart';
import 'page_navigation_button.dart';

class PageNavigationButtonsColumn extends StatelessWidget {
  final VoidCallback moveToNextPage;
  final VoidCallback moveToPreviousPage;
  final WidgetRef ref;

  const PageNavigationButtonsColumn({
    required this.moveToNextPage,
    required this.moveToPreviousPage,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageNavigationButton(
          icon: Icons.arrow_forward,
          onTap: moveToNextPage,
          ref: ref,
          hoverProvider: forwardButtonHoverProvider,
        ),
        const SizedBox(
          height: 32,
        ),
        PageNavigationButton(
          icon: Icons.arrow_back,
          onTap: moveToPreviousPage,
          ref: ref,
          hoverProvider: backButtonHoverProvider,
        ),
      ],
    );
  }
}
