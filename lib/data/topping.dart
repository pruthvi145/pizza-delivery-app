class Topping {
  final String id;
  final String name;
  final double price;
  final String thumbImage;
  final String flareArtboard;
  final String flareAsset = "assets/images/toppings/flare/pizza_toppings.flr";

  Topping(
      {this.name, this.price, this.thumbImage, this.id, this.flareArtboard});

  @override
  String toString() {
    return "Pizza: {Id:$id Name: $name, Price: $price, Image: $thumbImage, FlareAsset: $flareAsset}";
  }
}
