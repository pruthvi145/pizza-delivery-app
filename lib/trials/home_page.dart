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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16),
        Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16),
        Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16),
        Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16),
        Icon(Icons.star, color: Color(0xFFcb6b3e), size: 16),
      ],
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
  final PageController ctrl = PageController();
  Offset _pos = Offset(0, 0);
  Offset _posL = Offset(-210, 250);
  Offset _posR = Offset(210, 250);
  Offset _posN = Offset(310, 250);

  double _scale = 1.0;
  double _scaleR = 0.6;
  String _left = pizzas[0];
  String _current = pizzas[1];
  String _right = pizzas[2];

  void reset() {
    setState(() {
      _pos = Offset(0, 0);
      _posL = Offset(-210, 250);
      _posR = Offset(210, 250);
      _posN = Offset(310, 250);
      _scale = 1.0;
      _scaleR = 0.6;
    });
  }

  void animLeftPizza() {
    setState(() {
      _posL = Offset(_posL.dx - 100, 250);
    });
  }

  void animRightPizza() {
    setState(() {
      _posR = Offset(0, 0);
      _scaleR = 0.9;
    });
  }

  void animNextPizza() {
    setState(() {
      _posN = Offset(_posN.dx - 100, 250);
      _scaleR = 0.9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/circle-salad.png',
          width: 360,
        ),

        Container(
          margin: EdgeInsets.only(top: 35),
          child: Image.asset(
            'assets/images/wooden_plate2.png',
            width: 260,
          ),
        ),

        //Left
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 800),
          transform: Matrix4.translationValues(_posL.dx, _posL.dy, 0),
          width: 260 * 0.6,
          child: Image.asset(_left),
        ),
        //Right
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(_posR.dx, _posR.dy, 0),
          width: 260 * _scaleR,
          child: Image.asset(_right),
        ),
        //Next
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(_posN.dx, _posN.dy, 0),
          width: 260 * 0.6,
          child: Image.asset(_right),
        ),
        SwipeDetector(
          onSwipeLeft: () {
            setState(() {
              _scale = 0.7;
              _pos = Offset(-210, 250);
            });
            animLeftPizza();
            animRightPizza();
            animNextPizza();
          },
          onSwipeRight: () {
            reset();
          },
          swipeConfiguration: SwipeConfiguration(
            horizontalSwipeMaxHeightThreshold: 50.0,
            horizontalSwipeMinDisplacement: 50.0,
            horizontalSwipeMinVelocity: 200.0,
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 260 * _scale,
            transform: Matrix4.translationValues(_pos.dx, _pos.dy, 0),
            margin: EdgeInsets.only(top: 60),
            child: Image.asset(_current),
          ),
        ),
        // RaisedButton(
        //   onPressed: reset,
        //   child: Text("Reset"),
        // ),
      ],
    );
  }
}
