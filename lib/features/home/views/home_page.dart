import 'package:aditya_portfolio/features/home/views/about_page.dart';
import 'package:aditya_portfolio/features/home/views/servies_page.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/utils/color.dart';
import '../widgets/about_content.dart';
import '../widgets/bullet_points.dart';
import '../widgets/nev_bar.dart';
import 'introduction_page.dart';
import 'projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  'images/bg.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.5,
                ),
                // Purple Color Blend
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.5,
                  color: Color(
                    getColorHexFromStr(
                      "#0A115C",
                    ),
                  ).withOpacity(0.5),
                ),
                Column(
                  children: [
                    const NavBar(),
                    Stack(
                      children: [
                        const Column(
                          children: [
                            IntroductionPage(),
                            AboutPage(),
                          ],
                        ),
                        AboutContent(size: size),
                      ],
                    ),
                    const ServicesPage(),
                    const ProjectsPage(),
                  ],
                ),
              ],
            ),
            // Your other widgets go here
          ],
        ),
      ),
    );
  }
}
