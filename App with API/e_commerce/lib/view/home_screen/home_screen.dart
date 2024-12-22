import 'dart:developer';

import 'package:e_commerce/controller/get_all_product_controller.dart';
import 'package:e_commerce/view/home_screen/widgets/app_bar_title.dart';
import 'package:e_commerce/view/home_screen/widgets/leading_widget.dart';
import 'package:e_commerce/view/home_screen/widgets/pass_container.dart';
import 'package:e_commerce/view/product_detail_screen/product_detail_screen.dart';
import 'package:e_commerce/view/ui_helper/height_resolution.dart';
import 'package:e_commerce/view/ui_helper/width_resolution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List products = [];

  void getDataLocal() async {
    log("GET LOCAL");
    products =
        await Provider.of<GetAllProductController>(context, listen: false)
            .getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getDataLocal();
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.76,
          mainAxisSpacing: HeightResolution.responsiveHeight(
              context: context, responsiveHeight: 0.03),
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: WidthResolution.responsiveWidth(
                context: context,
                responsiveWidth: 0.05,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailScreen(
                        detailsOfProduct: products[index],
                        indexOfImage: index,
                      );
                    }));
                  },
                  child: Image.network(
                    products[index].listOfProductImage[0].imageURL,
                    height: 176,
                    width: 176,
                  ),
                ),
                Text(
                  "${products[index].title}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: WidthResolution.responsiveWidth(
                      context: context,
                      responsiveWidth: 0.033,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "${products[index].price} \$",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: WidthResolution.responsiveWidth(
                          context: context,
                          responsiveWidth: 0.04,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: WidthResolution.responsiveWidth(
                            context: context, responsiveWidth: 0.03),
                        vertical: HeightResolution.responsiveHeight(
                            context: context, responsiveHeight: 0.004),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Add",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
