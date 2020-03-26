import 'package:flutter/material.dart';
import 'package:pizza_delivery/data/pizza.dart';
import 'package:pizza_delivery/helpers/swipe_detector.dart';
import '../data/demo_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pizza> _pizzas;
  int _currentIndex = 1;
  bool isAnimating = false;
  static int count = 0;
  @override
  void initState() {
    _pizzas = DemoData.pizzas;
    super.initState();
  }

  void _leftSwipeHandler() {
    if (!isAnimating && _currentIndex + 1 < _pizzas.length) {
      setState(() {
        _currentIndex++;
        isAnimating = true;
      });
    }
  }

  void _rightSwipeHandler() {
    if (!isAnimating && _currentIndex - 1 >= 0) {
      setState(() {
        _currentIndex--;
        isAnimating = true;
      });
    }
  }

  void _onAnimationEnd() {
    isAnimating = false;
  }

  @override
  Widget build(BuildContext context) {
    count++;
    print(count);
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 6"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ..._buildPizzaList(),
            SwipeDetector(
              onSwipeLeft: _leftSwipeHandler,
              onSwipeRight: _rightSwipeHandler,
              swipeConfiguration:
                  SwipeConfiguration(horizontalSwipeMinDisplacement: 20),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 250,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPizza(int index,
      [PizzaGeometry pizzaGeometry = const PizzaGeometry()]) {
    return TweenAnimationBuilder<PizzaGeometry>(
      curve: Curves.easeInOut,
      onEnd: _onAnimationEnd,
      tween: Tween(begin: pizzaGeometry, end: pizzaGeometry),
      duration: Duration(milliseconds: 300),
      builder: (BuildContext context, PizzaGeometry data, Widget child) {
        return Transform.translate(
          offset: data.position,
          child: Transform.scale(
            scale: data.scale,
            child: child,
          ),
        );
      },
      child: Container(
        alignment: Alignment.topCenter,
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            "$index",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 70,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPizzaList() {
    List<Widget> pizzaList = [];
    for (int i = 0; i < _pizzas.length; i++) {
      Widget pizza;
      if (i == _currentIndex) {
        pizza = _buildPizza(i, PizzaGeometry.center());
      } else if (i == _currentIndex - 1) {
        //left
        pizza = _buildPizza(i, PizzaGeometry.left());
      } else if (i == _currentIndex + 1) {
        //right
        pizza = _buildPizza(i, PizzaGeometry.right());
      } else if (i < _currentIndex) {
        //prev
        pizza = _buildPizza(i, PizzaGeometry.prev());
      } else {
        //next
        pizza = _buildPizza(i, PizzaGeometry.next());
      }
      pizzaList.add(pizza);
    }
    return pizzaList;
  }
}

class PizzaGeometry {
  final Offset position;
  final double scale;

  const PizzaGeometry([
    this.position = const Offset(0.0, 0.0),
    this.scale = 1.0,
  ]);

  factory PizzaGeometry.center() {
    return PizzaGeometry(Offset(0.0, 0.0), 1.0);
  }
  factory PizzaGeometry.left() {
    return PizzaGeometry(Offset(-210, 250), 0.6);
  }
  factory PizzaGeometry.right() {
    return PizzaGeometry(Offset(210, 250), 0.6);
  }
  factory PizzaGeometry.prev() {
    return PizzaGeometry(Offset(-310, 250), 0.6);
  }
  factory PizzaGeometry.next() {
    return PizzaGeometry(Offset(310, 250), 0.6);
  }
  PizzaGeometry operator -(PizzaGeometry other) {
    return PizzaGeometry(position - other.position, scale - other.scale);
  }

  PizzaGeometry operator +(PizzaGeometry other) {
    return PizzaGeometry(other.position + position, other.scale + scale);
  }

  PizzaGeometry operator *(double oprand) {
    return PizzaGeometry(position * oprand, scale * oprand);
  }

  @override
  String toString() {
    return "Position: $position, Scale: $scale";
  }
}
