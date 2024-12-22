import 'package:flutter/material.dart';

class HeightResolution {
  static double responsiveHeight(
      {required BuildContext context, required double responsiveHeight}) {
    return MediaQuery.of(context).size.width * responsiveHeight;
  }
}
