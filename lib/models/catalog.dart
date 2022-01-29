class CatalogModels {
  static final Item  = [
    Items(
      id: 01,
      name: "PocoM2",
      desc: "6gb ram phone under 20k",
      price: 200,
      color: "black",
      image: "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/09/poco-m2-in-black-1600147203.jpg",
    )
  ];
}
class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Items({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}
