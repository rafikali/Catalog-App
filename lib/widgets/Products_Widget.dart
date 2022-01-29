import 'package:flutter/material.dart';
import 'package:helloworld/models/catalog.dart';

class  ProductsWidget extends StatelessWidget {

  final Items item;

  const ProductsWidget({Key? key, required this.item}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
  leading: Image.network(item.image),
      title: Text(item.name),
      subtitle: Text(item.desc),
      trailing: Text(item.price.toString()),

    );
  }
}