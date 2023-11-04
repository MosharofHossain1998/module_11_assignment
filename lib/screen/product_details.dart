import 'package:flutter/material.dart';
import 'package:module_11_assignment/screen/product_list_screen.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key,required this.productClass});
  final ProductClass productClass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 50,),
              Image.network(productClass.url,fit: BoxFit.contain,),
              const SizedBox(height: 20,),
              Text('Title: ${productClass.title}',style: const TextStyle(fontSize: 16),),
              const SizedBox(height: 10,),
              Center(child: Text('ID: ${productClass.id}',style: const TextStyle(fontSize: 18),)),
            ],
          ),
        ),
      ),
    );
  }
}