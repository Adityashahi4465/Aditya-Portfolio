import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final Size size;
  final Color color;
  const ProjectCard({
    super.key,
    required this.size, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.75,
      width: size.width * 0.38,
      color: color,
    );
  }
}
