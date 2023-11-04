import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module_11_assignment/screen/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductClass> product = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchItem(context);
    super.initState();
  }

  void fetchItem(context) async {
    // ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    setState(() {
      isLoading = true;
    });
    try {
      Response response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        List<dynamic> fetchItems = jsonDecode(response.body);
        //print(fetchItems);

        for (Map<String, dynamic> fetchJson in fetchItems) {
          product.add(ProductClass(
            fetchJson['id'],
            fetchJson['title'],
            fetchJson['url'],
            fetchJson['thumbnailUrl'],
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('API Request Failed!!! StatusCode: ${response.statusCode}'),
          duration: const Duration(seconds: 3),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error During API Request :$e'),
        duration: const Duration(seconds: 3),
      ));
    }

    isLoading = false;
    setState(() {
      // Update the UI as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListView.separated(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return productItem(
                    productClass: product[index],
                    indexOfProduct: index,
                    productItemList: product,
                  );
                },
                separatorBuilder: (_, __) {
                  return const Divider(
                    height: 7,
                  );
                },
              ),
            ),
    );
  }
}

class ProductClass {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  ProductClass(this.id, this.title, this.url, this.thumbnailUrl);
}
