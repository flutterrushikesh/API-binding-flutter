import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Delivery in",
        style: GoogleFonts.poppins(
          fontSize: WidthResolution.responsiveWidth(
            context: context,
            responsiveWidth: 0.041,
          ),
        ),
        children: [
          TextSpan(
            text: " 5 Mins",
            style: GoogleFonts.poppins(
              fontSize: WidthResolution.responsiveWidth(
                  context: context, responsiveWidth: 0.047),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
