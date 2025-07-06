import 'package:aditya_portfolio/core/utils/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/section_title.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../theme/app_colors.dart';
import '../widgets/service_item.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const SectionHeading(
            title: 'Services',
          ),
          const SizedBox(height: 16),
          ResponsiveLayout.isLargeScreen(context)
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServiceItem(
                      title: 'Web Design & Development',
                      description:
                          'Crafting standout websites with compelling design and seamless functionality for a strong online presence.',
                      serviceNumberShape: serviceShapeOnePath,
                      serviceImage: webDesignServiceImageOPath,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ServiceItem(
                      title: 'Mobile App Development',
                      description:
                          "Transforming ideas into user-friendly mobile apps with Flutter for an engaging experience.",
                      serviceNumberShape: serviceShapeTwoPath,
                      serviceImage: mobileServiceImageOPath,
                    ),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ServiceItem(
                      title: 'Web Design & Development',
                      description:
                          'Crafting standout websites with compelling design and seamless functionality for a strong online presence.',
                      serviceNumberShape: serviceShapeOnePath,
                      serviceImage: webDesignServiceImageOPath,
                    ),
                    ServiceItem(
                      title: 'Mobile App Development',
                      description:
                          "Transforming ideas into user-friendly mobile apps with Flutter for an engaging experience.",
                      serviceNumberShape: serviceShapeTwoPath,
                      serviceImage: mobileServiceImageOPath,
                    ),
                  ],
                ),
          const SizedBox(height: 16),
          ResponsiveLayout.isLargeScreen(context)
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ServiceItem(
                      title: 'Backend Development',
                      description:
                          'Building robust server-side solutions to power your apps with efficiency and scalability.',
                      serviceNumberShape: serviceShapeThreePath,
                      serviceImage: backendServiceImageOPath,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ServiceItem(
                      title: 'Cross Platform Development',
                      description:
                          'Developing apps that work across devices with one codebase for broader accessibility.',
                      serviceNumberShape: serviceShapeFourPath,
                      serviceImage: crossPlatformServiceImageOPath,
                    ),
                  ],
                )
              : const Column(
                  children: [
                    ServiceItem(
                      title: 'Backend Development',
                      description:
                          'Building robust server-side solutions to power your apps with efficiency and scalability.',
                      serviceNumberShape: serviceShapeThreePath,
                      serviceImage: backendServiceImageOPath,
                    ),
                    ServiceItem(
                      title: 'Cross Platform Development',
                      description:
                          'Developing apps that work across devices with one codebase for broader accessibility.',
                      serviceNumberShape: serviceShapeFourPath,
                      serviceImage: crossPlatformServiceImageOPath,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
