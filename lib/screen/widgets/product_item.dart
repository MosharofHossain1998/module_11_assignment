import 'package:flutter/material.dart';

import '../product_details.dart';
import '../product_list_screen.dart';


class productItem extends StatefulWidget {
  productItem({
    super.key,
    required this.productClass,
    required this.indexOfProduct,
    required this.productItemList,
  });
  final ProductClass productClass;
  final int indexOfProduct;
  List<ProductClass> productItemList=[];

  @override
  State<productItem> createState() => _productItemState();
}

class _productItemState extends State<productItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                  productClass: widget.productItemList[widget.indexOfProduct],
                )));
      },
      leading:Image.network(widget.productClass.thumbnailUrl),
      title: Text(widget.productClass.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
    );
  }
}