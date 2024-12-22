import 'package:flutter/material.dart';

class WidthResolution {
  static double responsiveWidth(
      {required BuildContext context, required double responsiveWidth}) {
    return MediaQuery.of(context).size.width * responsiveWidth;
  }
}
