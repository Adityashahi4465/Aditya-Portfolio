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
      begin: const Offset(3.5, -1),
      end: const Offset(3.5, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: curve,
      ),
    );
    bottomWidgetAnimation = Tween<Offset>(
      begin: const Offset(0.1, 1),
      end: const Offset(0.1, 0.7),
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
        containerWidthNotifier.value = 600;
      },
      onExit: (_) {
        animationController.reverse();
        containerWidthNotifier.value = 0;
      },
      child: SizedBox(
        height: widget.size.height * 0.75,
        width: widget.size.width * 0.38,
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
                  color: AppColors.primary.withOpacity(.6),
                  duration: const Duration(milliseconds: 200),
                  height: widget.size.height * 0.75,
                  width: value,
                );
              },
            ),
            AnimatedBuilder(
              animation: topTextAnimation,
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
                    position: topTextAnimation,
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Work'),
                  ),
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
    );
  }
}
