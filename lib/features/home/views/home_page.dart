import 'package:aditya_portfolio/features/home/views/about_page.dart';
import 'package:aditya_portfolio/features/home/views/servies_page.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/utils/color.dart';
import '../widgets/about_content.dart';
import '../widgets/nev_bar.dart';
import 'contact_page.dart';
import 'home_footer.dart';
import 'introduction_page.dart';
import 'projects_page.dart';
import 'testimonials_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final testimonialKey = GlobalKey();
  final contactKey = GlobalKey();
  final Map<String, GlobalKey> sectionKeys = {};

  void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key != null) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    sectionKeys.addAll({
      "Home": homeKey,
      "About": aboutKey,
      "Projects": projectsKey,
      "Testimonial": testimonialKey,
      "Contact": contactKey,
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('home page built');
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  bgImagePath,
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
                    NavBar(
                      onItemTap: scrollToSection,
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            const IntroductionPage(),
                            AboutPage(
                              key: aboutKey,
                            ),
                          ],
                        ),
                        AboutContent(size: size),
                      ],
                    ),
                    ServicesPage(
                      key: servicesKey,
                    ),
                    ProjectsPage(
                      key: projectsKey,
                    ),
                    TestimonialsPage(
                      key: testimonialKey,
                    ),
                    ContactPage(
                      key: contactKey,
                    ),
                    const HomeFooter()
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
