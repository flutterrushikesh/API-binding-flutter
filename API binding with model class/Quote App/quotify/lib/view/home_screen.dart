import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:quotify/model/qoute_model.dart';
import 'package:quotify/model/single_quote_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  List<SingleQuotsModel> singleQuoteModelObjList = [];

  @override
  void initState() {
    getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quotify",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Text(singleQuoteModelObjList[index].quote!),
                Text(singleQuoteModelObjList[index].author!),
              ],
            ),
          );
        }));
  }

  void getQuotes() async {
    Uri url = Uri.parse('https://dummyjson.com/quotes');

    http.Response response = await http.get(url);
    // log(response.body);

    Map<String, dynamic> responseJson = json.decode(response.body);
    QuoteModel quoteModelObj = QuoteModel(responseJson);
    setState(() {
      singleQuoteModelObjList = quoteModelObj.singleQuotsModelObjList!;
      log('$singleQuoteModelObjList');
    });
  }
}
