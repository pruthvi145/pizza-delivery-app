import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_delivery/data/demo_data.dart';
import 'package:pizza_delivery/data/pizza.dart';
import 'package:pizza_delivery/helpers/styles.dart';
import 'package:pizza_delivery/provider/current_pizza_index_notifier.dart';
import 'package:pizza_delivery/widgets/add_to_cart_button.dart';
import 'package:pizza_delivery/widgets/custom_radio.dart';
import 'package:provider/provider.dart';

import '../pizza_details_page.dart';
import 'home_widgets/pizza_carousel.dart';

List<Pizza> _pizzas = DemoData.pizzas;

class PizzaPalate extends StatelessWidget {
  Widget _buildPizzaPalateBack() {
    return Container(
      //TODO: Make it dynamic
      margin: EdgeInsets.only(top: 80),
      width: 230,
      height: 520,
      decoration: BoxDecoration(
        gradient: Styles.pizzaPalateBackgroundGradient,
        borderRadius: BorderRadius.circular(115),
        boxShadow: Styles.pizzaPalateShadow,
      ),
    );
  }

  Widget _buildPizzaPalateFront(BuildContext context) {
    return Column(
      children: <Widget>[
        PizzaCarousel(children: _pizzas),
        SizedBox(height: 50),
        HomePizzaDetails(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          _buildPizzaPalateBack(),
          _buildPizzaPalateFront(context),
        ],
      ),
    );
  }
}

class HomePizzaDetails extends StatefulWidget {
  @override
  _HomePizzaDetailsState createState() => _HomePizzaDetailsState();
}

class _HomePizzaDetailsState extends State<HomePizzaDetails>
    with SingleTickerProviderStateMixin {
  AnimationController? _anim;

  int? _oldIndex;
  @override
  void initState() {
    _anim = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _anim!.addListener(() => setState(() {}));
    super.initState();
  }

  Widget buildPizzaName(BuildContext context, String name) {
    return Transform.translate(
      offset: Offset(0, 5 * -_anim!.value),
      child: Opacity(
        opacity: _anim!.value,
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'IntroHeadB',
            fontSize: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget buildPizzaPrice(BuildContext context, double price) {
    return Transform.translate(
      offset: Offset(0, 5 * -_anim!.value),
      child: Opacity(
        opacity: _anim!.value,
        child: Text(
          "\$$price",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 48,
            fontFamily: "RozhaOne",
          ),
        ),
      ),
    );
  }

  Widget buildPizzaRatings(int rating) {
    List<Widget> startIcons = List.generate(
      5,
      (int index) => index < rating
          ? Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16)
          : Icon(Icons.star_border, color: Color(0xFFcb6b3e), size: 16),
    );
    return Opacity(
      opacity: _anim!.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: startIcons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex =
        Provider.of<CurrentPizzaIndexNotifier>(context, listen: false)
            .currentIndex;
    if (_oldIndex != _currentIndex) {
      _anim!.forward(from: 0);
    }
    _oldIndex = _currentIndex;
    Pizza pizza = _pizzas[_currentIndex];
    return Column(
      children: <Widget>[
        buildPizzaName(context, pizza.name!),
        buildPizzaRatings(pizza.rating),
        buildPizzaPrice(context, pizza.getTotal()),
        CustomRadio(),
        SizedBox(height: 25),
        AddToCartButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PizzaDetailPage(pizza),
              ),
            );
          },
        ),
      ],
    );
  }
}
