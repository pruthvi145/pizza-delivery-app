import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipedetector/swipedetector.dart';

List<String> pizzas = [
  'assets/images/pizza1.png',
  'assets/images/pizza2.png',
  'assets/images/pizza3.png',
  'assets/images/pizza4.png',
  'assets/images/pizza5.png',
  'assets/images/pizza6.png',
  'assets/images/pizza7.png',
  'assets/images/pizza8.png',
  'assets/images/pizza9.png',
  'assets/images/pizza10.png',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 45),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFf9f5f2),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeHeader(),
              SizedBox(height: 30),
              HomeTag(),
              SizedBox(height: 20),
              PizzaPalate(),
              // MyHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Order Manually',
                style: TextStyle(
                  fontFamily: 'IntroHeadB',
                  fontSize: 36,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  size: 13,
                ),
                SizedBox(width: 10),
                Text(
                  "Washington Park",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/cart.png'),
        ),
      ],
    );
  }
}

class HomeTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 32,
      decoration: BoxDecoration(
        color: Color(0xFFf6d06b),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        "Pizza",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: "Impact",
          color: Theme.of(context).primaryColor,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class PizzaPalate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          buildPizzaPalateBack(),
          buildPizzaPalateFront(context),
        ],
      ),
    );
  }

  Column buildPizzaPalateFront(BuildContext context) {
    return Column(
      children: <Widget>[
        HomePizza(),
        SizedBox(height: 10),
        buildPizzaName(context),
        buildPizzaRatings(),
        buildPizzaPrice(context),
        buildPizzaSizeOptions(context),
        SizedBox(height: 25),
        buildAddToCartButton(),
      ],
    );
  }

  Container buildPizzaPalateBack() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      width: 230,
      height: 520,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5],
          colors: [
            Color(0xFFfbf9f7),
            Color(0xFFfffef9),
          ],
        ),
        borderRadius: BorderRadius.circular(115),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 45.0),
            blurRadius: 99,
            spreadRadius: -50,
            color: Color(0x4D522a21),
          ),
        ],
      ),
    );
  }

  Text buildPizzaName(BuildContext context) {
    return Text(
      "New Orleans Pizza",
      style: TextStyle(
        fontFamily: 'IntroHeadB',
        fontSize: 28,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Text buildPizzaPrice(BuildContext context) {
    return Text(
      "\$15",
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 48,
        fontFamily: "RozhaOne",
      ),
    );
  }

  Row buildPizzaRatings() {
    List<Widget> startIcons = List.generate(
        5, (int index) => Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: startIcons,
    );
  }

  Row buildPizzaSizeOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "S",
          style: TextStyle(
            color: Color(0xFF522a21),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          alignment: Alignment.center,
          child: Text(
            "M",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A584000),
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ],
          ),
          width: 45,
          height: 45,
        ),
        Text(
          "L",
          style: TextStyle(
            color: Color(0xFF522a21),
          ),
        ),
      ],
    );
  }

  Widget buildAddToCartButton() {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFf6d06b),
              Color(0xFFf75e39),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFfe8c00),
              offset: Offset(0, 11),
              blurRadius: 11,
              spreadRadius: -5,
            ),
          ],
        ),
        width: 60,
        height: 60,
        padding: EdgeInsets.all(15),
        child: Image.asset(
          'assets/images/cart.png',
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}

class HomePizza extends StatefulWidget {
  const HomePizza({
    Key key,
  }) : super(key: key);

  @override
  _HomePizzaState createState() => _HomePizzaState();
}

class _HomePizzaState extends State<HomePizza> {
  int index = 1;
  int leftI = 0;
  int rightI = 2;
  int nextI = 3;
  int prevI = -1 % pizzas.length;
  SwipeDir dir;
  double angle = 0;
  PizzaGeometry left = PizzaGeometry.left();
  PizzaGeometry right = PizzaGeometry.right();
  PizzaGeometry center = PizzaGeometry.center();
  PizzaGeometry next = PizzaGeometry.next();
  PizzaGeometry prev = PizzaGeometry.prev();

  void onAnimationEnd() {
    if (dir != null) {
      // int tempCur = index;
      setState(() {
        // index = dir == SwipeDir.left ? rightI : leftI;
        // leftI = dir == SwipeDir.left ? tempCur : (leftI - 1) % pizzas.length;
        // rightI = dir == SwipeDir.left ? (rightI + 1) % pizzas.length : tempCur;
        dir = null;
      });
      // print("Left: " + leftI.toString());
      // print(index);
      // print("right: $rightI");
      // left = PizzaGeometry.left();
      // right = PizzaGeometry.right();
      // center = PizzaGeometry.center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 500),
          tween: Tween<double>(begin: 0.0, end: angle),
          builder: (BuildContext context, double angle, Widget child) {
            return Transform.rotate(
              angle: angle,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/circle-salad.png',
            width: 360,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 35),
          child: Image.asset(
            'assets/images/wooden_plate2.png',
            width: 260,
          ),
        ),

        //Prev
        Positioned(
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder<PizzaGeometry>(
            duration: Duration(milliseconds: 500),
            tween: Tween<PizzaGeometry>(
              begin: PizzaGeometry.prev(),
              end: prev,
            ),
            onEnd: onAnimationEnd,
            builder: (BuildContext context, PizzaGeometry pizzaGeometry,
                Widget child) {
              // print("$pizzaGeometry");
              return Transform.translate(
                offset: pizzaGeometry.position,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 260 * pizzaGeometry.scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(pizzas[prevI]),
          ),
        ),
        //Left
        Positioned(
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder<PizzaGeometry>(
            duration: Duration(milliseconds: 500),
            tween: Tween<PizzaGeometry>(
              begin: PizzaGeometry.left(),
              end: left,
            ),
            onEnd: onAnimationEnd,
            builder: (BuildContext context, PizzaGeometry pizzaGeometry,
                Widget child) {
              // print("$pizzaGeometry");
              return Transform.translate(
                offset: pizzaGeometry.position,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 260 * pizzaGeometry.scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(pizzas[leftI]),
          ),
        ),
        //Right
        Positioned(
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder<PizzaGeometry>(
            duration: Duration(milliseconds: 500),
            tween: Tween<PizzaGeometry>(
              begin: PizzaGeometry.right(),
              end: right,
            ),
            builder: (BuildContext context, PizzaGeometry pizzaGeometry,
                Widget child) {
              // print("$pizzaGeometry");
              return Transform.translate(
                offset: pizzaGeometry.position,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 260 * pizzaGeometry.scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(pizzas[rightI]),
          ),
        ),
        //Next
        Positioned(
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder<PizzaGeometry>(
            duration: Duration(milliseconds: 500),
            tween: Tween<PizzaGeometry>(
              begin: PizzaGeometry.next(),
              end: next,
            ),
            builder: (BuildContext context, PizzaGeometry pizzaGeometry,
                Widget child) {
              // print("$pizzaGeometry");
              return Transform.translate(
                offset: pizzaGeometry.position,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 260 * pizzaGeometry.scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(pizzas[rightI]),
          ),
        ),
        //Center
        Positioned(
          top: 0,
          bottom: 0,
          child: TweenAnimationBuilder<PizzaGeometry>(
            duration: Duration(milliseconds: 500),
            tween: Tween<PizzaGeometry>(
              begin: PizzaGeometry.center(),
              end: center,
            ),
            builder: (BuildContext context, PizzaGeometry pizzaGeometry,
                Widget child) {
              // print("$pizzaGeometry");
              return Transform.translate(
                offset: pizzaGeometry.position,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 260 * pizzaGeometry.scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(pizzas[index]),
          ),
        ),
        SwipeDetector(
          onSwipeLeft: () {
            setState(() {
              dir = SwipeDir.left;
              left = PizzaGeometry.prev();
              right = PizzaGeometry.center();
              center = PizzaGeometry.left();
              next = PizzaGeometry.right();
              angle -= pi / 4;
            });
          },
          onSwipeRight: () {
            setState(() {
              dir = SwipeDir.right;
              left = PizzaGeometry.center();
              right = PizzaGeometry.next();
              center = PizzaGeometry.right();
              prev = PizzaGeometry.left();
              angle += pi / 4;
            });
          },
          child: Opacity(
            opacity: 0.0,
            child: Container(
              height: 260,
              width: double.infinity,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

class PizzaGeometry {
  final Offset position;
  final double scale;

  PizzaGeometry(this.position, this.scale);

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

enum SwipeDir { left, right }

class Pizza extends StatefulWidget {
  final Tween<PizzaGeometry> tweenController;
  final int index;
  final Duration animationDuration;

  const Pizza({
    Key key,
    @required this.tweenController,
    this.index = 0,
    this.animationDuration = const Duration(milliseconds: 500),
  }) : super(key: key);
  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: TweenAnimationBuilder<PizzaGeometry>(
        duration: widget.animationDuration,
        tween: widget.tweenController,
        builder:
            (BuildContext context, PizzaGeometry pizzaGeometry, Widget child) {
          // print("$pizzaGeometry");
          return Transform.translate(
            offset: pizzaGeometry.position,
            child: Transform.scale(
              scale: pizzaGeometry.scale,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                // width: 260 * pizzaGeometry.scale,
                child: child,
              ),
            ),
          );
        },
        child: Image.asset(pizzas[widget.index]),
      ),
    );
  }
}
