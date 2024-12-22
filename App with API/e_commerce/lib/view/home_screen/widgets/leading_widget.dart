import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.account_circle_outlined,
      size: WidthResolution.responsiveWidth(
        context: context,
        responsiveWidth: 0.09,
      ),
      color: Colors.white,
    );
  }
}
