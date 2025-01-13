import 'package:e_commerce/controller/add_to_cart_controller.dart';
import 'package:e_commerce/view/ui_helper/height_resolution.dart';

import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: GoogleFonts.poppins(
            fontSize: WidthResolution.responsiveWidth(
              context: context,
              responsiveWidth: 0.041,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount:
            Provider.of<AddToCartController>(context).listOfCartProducts.length,
        itemBuilder: (context, index) {
          AddToCartController localObj =
              Provider.of<AddToCartController>(context);
          return Container(
            child: Row(
              children: [
                Image.network(
                  localObj.listOfCartProducts[index].listOfProductImage![0]
                      .imageURL!,
                  height: HeightResolution.responsiveHeight(
                    context: context,
                    responsiveHeight: 0.25,
                  ),
                ),
                Column(
                  children: [
                    Text(localObj.listOfCartProducts[index].title!),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
