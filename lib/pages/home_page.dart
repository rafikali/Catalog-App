import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/models/catalog.dart';
import 'package:helloworld/widgets/Products_Widget.dart';
import 'package:helloworld/widgets/drawer.dart';
import 'dart:convert';
import 'package:helloworld/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';


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
   var models = catalogModels;
   _isFetching = false;

   setState(() {

   });

  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CatalogHeader(),
              CatalogList(),
            ],
          ),
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

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  get models => null;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

        itemCount: models!.product!.length,
        itemBuilder: (context, index) {
          final item = models!.products![index];
          return CatalogItem(item);
        }
    );
  }
  }


class  CatalogItem extends StatelessWidget {
  final Item products;
  const (required this.products, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
    color: MyTheme.darkBluishColor,
    );
  }
}



class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Catalog App', style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: MyTheme.darkBluishColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,

            )
        ),),
        const Text('Trending apps',
          style: TextStyle(
            fontSize: 20,
          ),)
      ],
    );
  }
}






