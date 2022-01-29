import 'package:flutter/material.dart';
import 'package:helloworld/models/catalog.dart';
import 'package:helloworld/widgets/Products_Widget.dart';
import 'package:helloworld/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  final int days = 30;
  String name = 'rafik';

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),

            body: ListView.builder(
              itemCount: CatalogModels.Item.length,
                itemBuilder: (context, index) {
                return ProductsWidget(
                    item: CatalogModels.Item[index],
                );
                },
            ),

      drawer: const MyDrawer(),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}