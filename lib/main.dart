import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:device_preview/device_preview.dart';
import 'package:module_11_assignment/screen/product_list_screen.dart';

void main() {
  runApp(
      DevicePreview(
        builder: (context) {
           return const MyApp();
     }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductListScreen(),
    );
  }
}
