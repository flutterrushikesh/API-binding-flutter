import 'package:e_commerce/controller/add_to_cart_controller.dart';
import 'package:e_commerce/view/cart_screen/cart_screen.dart';
import 'package:e_commerce/view/home_screen/widgets/app_bar_title.dart';
import 'package:e_commerce/view/home_screen/widgets/leading_widget.dart';
import 'package:e_commerce/view/home_screen/widgets/pass_container.dart';
import 'package:e_commerce/view/home_screen/widgets/product_grid_view.dart';
import 'package:e_commerce/view/ui_helper/height_resolution.dart';
import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const LeadingWidget(),
        title: const AppBarTitle(),
        actions: const [
          PassContainer(),
        ],
      ),
      body: const ProductGridView(),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          vertical: HeightResolution.responsiveHeight(
              context: context, responsiveHeight: 0.02),
          horizontal: WidthResolution.responsiveWidth(
              context: context, responsiveWidth: 0.043),
        ),
        padding: EdgeInsets.symmetric(
          vertical: HeightResolution.responsiveHeight(
            context: context,
            responsiveHeight: 0.02,
          ),
          horizontal: WidthResolution.responsiveWidth(
              context: context, responsiveWidth: 0.041),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${Provider.of<AddToCartController>(context).listOfCartProducts.length}  |   ",
                style: GoogleFonts.poppins(
                  fontSize: WidthResolution.responsiveWidth(
                    context: context,
                    responsiveWidth: 0.041,
                  ),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "${Provider.of<AddToCartController>(context).itemTotal} \$",
                style: GoogleFonts.poppins(
                  fontSize: WidthResolution.responsiveWidth(
                    context: context,
                    responsiveWidth: 0.041,
                  ),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
