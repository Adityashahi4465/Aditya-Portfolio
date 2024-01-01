import 'package:aditya_portfolio/features/home/views/about_page.dart';
import 'package:aditya_portfolio/features/home/views/servies_page.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/color.dart';
import '../widgets/nev_bar.dart';
import 'introduction_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * 1.1,
                ),
                // Purple Color Blend
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.1,
                  color: Color(
                    getColorHexFromStr(
                      "#0A115C",
                    ),
                  ).withOpacity(0.5),
                ),
                const NavBar(),
                const IntroductionPage(),
              ],
            ),
            const AboutPage(),

            const ServicesPage(),
            // Your other widgets go here
          ],
        ),
      ),
    );
  }
}
