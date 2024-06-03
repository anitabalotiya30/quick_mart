import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api_services.dart';
import 'product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final products = <Product>[].obs;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    log('message');
    final mainList = await ApiServices.getApi(endpoint: 'products');
    if (mainList != null) {
      var data = mainList.map((e) => Product.fromJson(e)).toList();
      log('products --- $data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => getProducts(), child: const Text('Click me')),
      ),
    );
  }
}
