import 'dart:developer';
import 'package:ccarts_example/controller/api_binding_controller.dart';
import 'package:ccarts_example/models/multiplecarts_model.dart';
import 'package:ccarts_example/views/history_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State {
  List<MultipleCartsModel> cartModelObjList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const HistoryScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartModelObjList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text("${cartModelObjList[index].alldiscountTotal}"),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
          getDataforLocal();
        },
        label: const Text('Show Data'),
      ),
    );
  }

  @override
  void initState() {
    getDataforLocal();
    super.initState();
  }

  getDataforLocal() async {
    List<MultipleCartsModel> localList = await getCartData();
    for (int i = 0; i <= cartModelObjList.length; i++) {
      cartModelObjList.add(localList[i]);
      log("${localList[i]}");
    }
  }
}
