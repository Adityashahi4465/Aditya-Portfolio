import 'package:aditya_portfolio/core/constants/projects.dart';
import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/section_title.dart';
import '../../../common/hover_animation_project_card.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../theme/app_colors.dart';
import '../widgets/service_item.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.primaryLightDark,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: ResponsiveLayout.isLargeScreen(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeading(
                      title: 'Projects',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AnimatedProjectCard(
                      size: size,
                      color: AppColors.accentLight,
                      project: projects[0],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    AnimatedProjectCard(
                      size: size,
                      color: AppColors.accentDark,
                      project: projects[2],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    AnimatedProjectCard(
                      size: size,
                      color: AppColors.brightBorderColor,
                      project: projects[1],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    AnimatedProjectCard(
                      size: size,
                      color: AppColors.greyDark,
                      project: projects[3],
                    ),
                    const SizedBox(
                      height: 74,
                    ),
                    const MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: AutoSizeText(
                        'See More Work...',
                        maxFontSize: 44,
                        minFontSize: 38,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionHeading(
                  title: 'Projects',
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedProjectCard(
                  size: size,
                  color: AppColors.accentLight,
                  project: projects[0],
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimatedProjectCard(
                  size: size,
                  color: AppColors.accentDark,
                  project: projects[1],
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimatedProjectCard(
                  size: size,
                  color: AppColors.brightBorderColor,
                  project: projects[2],
                ),
                const SizedBox(
                  height: 16,
                ),
                AnimatedProjectCard(
                  size: size,
                  color: AppColors.greyDark,
                  project: projects[3],
                ),
                const SizedBox(
                  height: 74,
                ),
                const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AutoSizeText(
                    'See More Work...',
                    maxFontSize: 44,
                    minFontSize: 38,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
