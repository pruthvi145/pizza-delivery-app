import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pizza_delivery/data/pizza.dart';
import 'package:pizza_delivery/helpers/pizza_geometry.dart';
import 'package:pizza_delivery/helpers/swipe_detector.dart';
import 'package:pizza_delivery/provider/current_pizza_index_notifier.dart';
import 'package:provider/provider.dart';

import '../../pizza_details_page.dart';

class PizzaCarousel extends StatefulWidget {
  final List<Pizza>? children;
  const PizzaCarousel({
    Key? key,
    this.children,
  }) : super(key: key);

  @override
  _PizzaCarouselState createState() => _PizzaCarouselState();
}

class _PizzaCarouselState extends State<PizzaCarousel> {
  double angle = 0.0;
  bool isAnimating = false;

  void _leftSwipeHandler() {
    int _currentIndex =
        Provider.of<CurrentPizzaIndexNotifier>(context, listen: false)
            .currentIndex;
    if (!isAnimating && _currentIndex + 1 < widget.children!.length) {
      setState(() {
        Provider.of<CurrentPizzaIndexNotifier>(context, listen: false)
            .currentIndex++;
        angle -= pi / 4;
        isAnimating = true;
      });
    }
  }

  void _rightSwipeHandler() {
    int _currentIndex =
        Provider.of<CurrentPizzaIndexNotifier>(context, listen: false)
            .currentIndex;

    if (!isAnimating && _currentIndex - 1 >= 0) {
      setState(() {
        Provider.of<CurrentPizzaIndexNotifier>(context, listen: false)
            .currentIndex--;
        angle += pi / 4;
        isAnimating = true;
      });
    }
  }

  void _onAnimationEnd() {
    isAnimating = true;
  }

  Widget _buildPizza(
    Pizza pizza, [
    PizzaGeometry pizzaGeometry = const PizzaGeometry(),
  ]) {
    return TweenAnimationBuilder<PizzaGeometry>(
      curve: Curves.easeInOut,
      onEnd: _onAnimationEnd,
      tween: Tween(begin: pizzaGeometry, end: pizzaGeometry),
      duration: Duration(milliseconds: 400),
      builder: (BuildContext context, PizzaGeometry data, Widget? child) {
        return Transform.translate(
          offset: data.position,
          child: Transform.scale(
            scale: data.scale,
            child: child!,
          ),
        );
      },
      child: Image.asset(
        pizza.image!,
        width: 230,
        fit: BoxFit.fill,
      ),
    );
  }

  List<Widget> _buildPizzaList() {
    List<Widget> pizzaList = [];
    for (int i = 0; i < widget.children!.length; i++) {
      Widget pizza;
      int _currentIndex =
          Provider.of<CurrentPizzaIndexNotifier>(context, listen: true)
              .currentIndex;

      if (i == _currentIndex) {
        pizza = _buildPizza(widget.children![i]);
      } else if (i == _currentIndex - 1) {
        //left
        pizza = _buildPizza(widget.children![i], PizzaGeometry.left());
      } else if (i == _currentIndex + 1) {
        //right
        pizza = _buildPizza(widget.children![i], PizzaGeometry.right());
      } else if (i < _currentIndex) {
        //prev
        pizza = _buildPizza(widget.children![i], PizzaGeometry.prev());
      } else {
        //next
        pizza = _buildPizza(widget.children![i], PizzaGeometry.next());
      }
      pizzaList.add(pizza);
    }
    return pizzaList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 400),
          tween: Tween<double>(begin: 0.0, end: angle),
          builder: (BuildContext context, double angle, Widget? child) {
            return Transform.rotate(
              angle: angle,
              child: child!,
            );
          },
          child: Image.asset(
            'assets/images/circle-salad.png',
            width: 350,
          ),
        ),
        Image.asset(
          'assets/images/wooden_plate2.png',
          width: 260,
        ),
        ..._buildPizzaList(),
        SwipeDetector(
          onSwipeLeft: _leftSwipeHandler,
          onSwipeRight: _rightSwipeHandler,
          swipeConfiguration:
              SwipeConfiguration(horizontalSwipeMinDisplacement: 20),
          child: Opacity(
            opacity: 0,
            child: InkWell(
              onTap: () {
                int _currentIndex = Provider.of<CurrentPizzaIndexNotifier>(
                        context,
                        listen: false)
                    .currentIndex;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaDetailPage(
                      widget.children![_currentIndex],
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.topCenter,
                height: 250,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
