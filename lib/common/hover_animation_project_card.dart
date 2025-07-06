import 'custom_button.dart';
import '../core/utils/responsive.dart';
import '../models/project.dart';
import '../theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Size size;
  final Color color;
  final Project project;
  const AnimatedProjectCard({
    super.key,
    required this.size,
    required this.color,
    required this.project,
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
    final project = widget.project;
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: widget.size.height * 0.75,
          width: ResponsiveLayout.isLargeScreen(context) ? 500 : 800,
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              Opacity(
                opacity: 0.8,
                child: Image.asset(
                  project.imageUrl,
                  fit: BoxFit.fill,
                  height: widget.size.height * 0.75,
                  width: ResponsiveLayout.isLargeScreen(context) ? 500 : 800,
                ),
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
                child: Text(
                  project.projectNo,
                  style: const TextStyle(
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
                    Text(
                      project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      project.category,
                      style: const TextStyle(
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
                          InkWell(
                            onTap: () {
                              if (project.links.isNotEmpty) {
                                final url = project.links.first;
                                if (Uri.tryParse(url)?.hasScheme ?? false) {
                                  launchUrl(Uri.parse(url));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Invalid URL'),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
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
