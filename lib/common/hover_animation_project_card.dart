import 'package:aditya_portfolio/common/custom_button.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Size size;
  final Color color;
  const AnimatedProjectCard({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard>
    with TickerProviderStateMixin {
  final containerWidthNotifier = ValueNotifier<double>(0);
  late Curve curve;

  late Animation<Offset> topTextAnimation;
  late Animation<Offset> largeTopTextAnimation;
  late Animation<Offset> bottomWidgetAnimation;
  late Animation<double> opacityAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    curve = Curves.fastEaseInToSlowEaseOut;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    topTextAnimation = Tween<Offset>(
      begin: const Offset(3, -1),
      end: const Offset(3, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: curve,
      ),
    );
    largeTopTextAnimation = Tween<Offset>(
      begin: const Offset(3, -1),
      end: const Offset(5, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: curve,
      ),
    );
    bottomWidgetAnimation = Tween<Offset>(
      begin: const Offset(0.1, 1),
      end: const Offset(0.05, 0.6),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: curve,
      ),
    );
    opacityAnimation = Tween<double>(begin: -0.2, end: 1).animate(
      animationController,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    containerWidthNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        animationController.forward();
        containerWidthNotifier.value = ResponsiveLayout.isLargeScreen(context)
            ? 500
            : ResponsiveLayout.isMediumScreen(context)
                ? 1050
                : 800;
      },
      onExit: (_) {
        animationController.reverse();
        containerWidthNotifier.value = 0;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: widget.size.height * 0.75,
          width: ResponsiveLayout.isLargeScreen(context) ? 500 : 800,
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Container(
                color: widget.color,
              ),
              ValueListenableBuilder(
                valueListenable: containerWidthNotifier,
                builder: (_, value, __) {
                  return AnimatedContainer(
                    color: AppColors.primary.withOpacity(0.6),
                    duration: const Duration(milliseconds: 200),
                    height: widget.size.height * 0.75,
                    width: value,
                  );
                },
              ),
              AnimatedBuilder(
                animation: ResponsiveLayout.isLargeScreen(context)
                    ? topTextAnimation
                    : largeTopTextAnimation,
                child: const Text(
                  '02',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                builder: (context, child) {
                  return FadeTransition(
                    opacity: opacityAnimation,
                    child: SlideTransition(
                      position: ResponsiveLayout.isLargeScreen(context)
                          ? topTextAnimation
                          : largeTopTextAnimation,
                      child: child,
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: bottomWidgetAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Website Development',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'WordPress . Blog',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.3),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 12,
                            ),
                            child: const Text(
                              'View Work',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                builder: (context, child) {
                  return FadeTransition(
                    opacity: opacityAnimation,
                    child: SlideTransition(
                      position: bottomWidgetAnimation,
                      child: child,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
