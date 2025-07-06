import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/app_colors.dart';

class PageNavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final WidgetRef ref;
  final StateProvider<bool> hoverProvider;

  const PageNavigationButton({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.ref,
    required this.hoverProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => ref.read(hoverProvider.notifier).state = true,
      onExit: (_) => ref.read(hoverProvider.notifier).state = false,
      child: InkWell(
        onTap: onTap, // Corrected: invoke the onTap function
        child: Container(
          height: 56,
          width: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.brightBorderColor, // Border color
              width: 1.0,
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, ref, child) {
              final isHovered = ref.watch(hoverProvider);
              return isHovered
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.brightBorderColor,
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.white,
                      ),
                    )
                  : Icon(
                      icon,
                      color: AppColors.white,
                    );
            },
          ),
        ),
      ),
    );
  }
}
