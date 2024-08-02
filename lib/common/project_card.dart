import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final Size size;
  final Color color;

  const ProjectCard({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.75,
      width: size.width * 0.38,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, bottom: 16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Project Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  color,
                  const Color.fromARGB(255, 20, 20, 20).withOpacity(0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
