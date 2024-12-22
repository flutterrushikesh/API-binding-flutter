import 'package:e_commerce/view/ui_helper/height_resolution.dart';
import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassContainer extends StatelessWidget {
  const PassContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: WidthResolution.responsiveWidth(
          context: context,
          responsiveWidth: 0.04,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: HeightResolution.responsiveHeight(
          context: context,
          responsiveHeight: 0.01,
        ),
        horizontal: WidthResolution.responsiveWidth(
          context: context,
          responsiveWidth: 0.04,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange),
      ),
      child: Text(
        "Pass",
        style: GoogleFonts.poppins(
          fontSize: WidthResolution.responsiveWidth(
            context: context,
            responsiveWidth: 0.041,
          ),
          color: Colors.orange,
        ),
      ),
    );
  }
}
