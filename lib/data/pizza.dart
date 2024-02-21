import 'package:pizza_delivery/data/topping.dart';

class Pizza {
  final String? name;
  final double? price;
  final int rating;
  final String? image;
  Set<Topping> toppings;

  Pizza({
    this.name,
    this.price,
    this.rating = 0,
    this.image,
    this.toppings = const {},
  }) : assert(rating <= 5, "Pizza rating must be less then 5.");

  @override
  String toString() {
    return "Pizza: {Name: $name, Price: $price, Rating: $rating, Image: $image, Toppings: $toppings}";
  }

  double getTotal() {
    double toppingPrice = 0.0;
    toppings.forEach((topping) {
      toppingPrice += topping.price!;
    });
    return price! + toppingPrice;
  }

  void resetToppings() {
    toppings = {};
  }
  //add fromjson and toJSON methods
}
