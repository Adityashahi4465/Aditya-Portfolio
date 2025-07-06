import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton({
    required this.buttonColor,
    required this.imagePath,
    super.key,
    required this.onPressed,
  });

  final Color buttonColor;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton>
    with TickerProviderStateMixin {
  final shimmerHeightNotifier = ValueNotifier<double>(0);
  final shimmerPusherNotifier = ValueNotifier<double>(0);

  late AnimationController _shimmerController;
  late AnimationController _shimmerPusherController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        final shimmerHeight = _shimmerController.value * 58;
        shimmerHeightNotifier.value = shimmerHeight;
        if (shimmerHeight >= 38 && !_shimmerPusherController.isAnimating) {
          _shimmerPusherController.forward();
        } else if (_shimmerController.status == AnimationStatus.reverse &&
            shimmerHeight <= 38) {
          _shimmerPusherController.reverse();
        }
        setState(() {});
      });
    _shimmerPusherController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        final shimmerPusherHeight = _shimmerPusherController.value * 58;
        shimmerPusherNotifier.value = shimmerPusherHeight;
        if (_shimmerPusherController.status == AnimationStatus.reverse &&
            shimmerPusherHeight <= 38) {
          _shimmerController.reverse();
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _shimmerPusherController.dispose();
    shimmerHeightNotifier.dispose();
    shimmerPusherNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 90,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (_) {
            _shimmerController.forward();
          },
          onExit: (_) {
            _shimmerPusherController.reverse();
          },
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Center(
              child: SizedBox(
                height: 58,
                width: 58,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: shimmerPusherNotifier,
                            builder: (_, value, __) {
                              return SizedBox(
                                height: value,
                              );
                            }),
                        Flexible(
                          child: ValueListenableBuilder(
                            valueListenable: shimmerHeightNotifier,
                            builder: (_, value, __) {
                              return Container(
                                width: 82,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: value,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SocialButton(
                      buttonColor: widget.buttonColor,
                      imagePath: widget.imagePath,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String imagePath;
  final Color buttonColor;
  const SocialButton({
    super.key,
    required this.imagePath,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: buttonColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 32.0,
          height: 32.0,
        ),
      ),
    );
  }
}
