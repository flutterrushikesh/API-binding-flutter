import 'package:e_commerce/model/all_product_model.dart';
import 'package:e_commerce/view/ui_helper/height_resolution.dart';
import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final AllProductModel detailsOfProduct;
  final int indexOfImage;
  const ProductDetailScreen(
      {super.key, required this.detailsOfProduct, required this.indexOfImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          detailsOfProduct.title!,
          style: GoogleFonts.poppins(
            fontSize: WidthResolution.responsiveWidth(
              context: context,
              responsiveWidth: 0.036,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            detailsOfProduct.listOfProductImage![0].imageURL!,
            height: 400,
            width: 400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: WidthResolution.responsiveWidth(
                  context: context, responsiveWidth: 0.04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailsOfProduct.title!,
                  style: GoogleFonts.poppins(
                    fontSize: WidthResolution.responsiveWidth(
                      context: context,
                      responsiveWidth: 0.04,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${detailsOfProduct.inStock!} In stock",
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                    context: context,
                    responsiveHeight: 0.1,
                  ),
                ),
                _labelText(
                  lableTitle: "Highlights",
                  context: context,
                ),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                      context: context, responsiveHeight: 0.05),
                ),
                _subLabelText(
                  sublabelText: "Brand :          ${detailsOfProduct.brand}",
                  context: context,
                ),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                      context: context, responsiveHeight: 0.01),
                ),
                _subLabelText(
                  sublabelText: "Category:     ${detailsOfProduct.category}",
                  context: context,
                ),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                      context: context, responsiveHeight: 0.1),
                ),
                _labelText(lableTitle: "Information", context: context),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                      context: context, responsiveHeight: 0.05),
                ),
                _subLabelText(
                  sublabelText: "Description: ${detailsOfProduct.description}",
                  context: context,
                ),
                SizedBox(
                  height: HeightResolution.responsiveHeight(
                      context: context, responsiveHeight: 0.05),
                ),
                _subLabelText(
                  sublabelText: "Warrenty:     ${detailsOfProduct.warranty}",
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _subLabelText(
      {required String sublabelText, required BuildContext context}) {
    return Text(
      sublabelText,
      style: GoogleFonts.poppins(
        fontSize: WidthResolution.responsiveWidth(
          context: context,
          responsiveWidth: 0.036,
        ),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _labelText(
      {required String lableTitle, required BuildContext context}) {
    return Text(
      lableTitle,
      style: GoogleFonts.poppins(
        fontSize: WidthResolution.responsiveWidth(
          context: context,
          responsiveWidth: 0.045,
        ),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
