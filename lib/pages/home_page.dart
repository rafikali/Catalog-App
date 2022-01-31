import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/models/catalog.dart';
import 'package:helloworld/widgets/Products_Widget.dart';
import 'package:helloworld/widgets/drawer.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  String name = 'rafik';
  CatalogModels? models;
  bool _isFetching = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{

   final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
   final decodedData = jsonDecode(catalogJson);
   CatalogModels catalogModels = CatalogModels.fromJson(decodedData);
   var productData = decodedData["products"];
    models = catalogModels;
   _isFetching = false;

   setState(() {

   });

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App',
          style: TextStyle(
              color: Colors.black),),
        centerTitle: true,
      ),

            body: Padding (
              padding: EdgeInsets.all(12.0),
            child: _isFetching ? CircularProgressIndicator(): GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 14.0

              ),

              itemCount: models!.products!.length,
                itemBuilder: (context, index) {
                    final item = models!.products![index];

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),

                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(14),
                        child: Text(item.name!,
                          style: TextStyle(color: Colors.white,
                           ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      footer: Text(item.price.toString()),
                      child: Image.network(item.image!),

                ),
                  );
                },
            ),
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