import 'package:aditya_portfolio/core/constants/assets_constants.dart';
import 'package:aditya_portfolio/theme/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../common/app_logo.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  final Function(String) onItemTap;

  const NavBar({
    super.key,
    required this.onItemTap,
  });

  List<Widget> navItem() {
    return UiConstants.navLinks.map(
      (text) {
        return GestureDetector(
          onTap: () => onItemTap(text),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                text,
                style: GoogleFonts.geologica(
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12).copyWith(top: 24),
        child: Row(
          mainAxisAlignment: (MediaQuery.of(context).size.width > 1150)
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const AppLogo(),
            SizedBox(
              width: MediaQuery.of(context).size.width > 1250 ? 130 : 10,
            ),
            if (MediaQuery.of(context).size.width > 1150)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ...navItem(),
                  const SizedBox(
                    width: 42,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.purple, // Adjust underline color
                          width: 1.0, // Adjust underline width
                        ),
                      ),
                    ),
                    child: AutoSizeText(
                      minFontSize: 20,
                      maxLines: 1,
                      "+91 99*** ***59",
                      style: GoogleFonts.geologica(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: 1,
                          fontFamily: "Montserrat-Bold",
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else if (MediaQuery.of(context).size.width > 600)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.purple, // Adjust underline color
                          width: 1.0, // Adjust underline width
                        ),
                      ),
                    ),
                    child: AutoSizeText(
                      minFontSize: 20,
                      maxLines: 1,
                      "+91 99*** ***59",
                      style: GoogleFonts.geologica(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          letterSpacing: 1,
                          fontFamily: "Montserrat-Bold",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.menu,
                      size: 32,
                    ),
                  )
                ],
              )
            else
              const Icon(
                Icons.menu,
              ),
          ],
        ),
      ),
    );
  }
}
