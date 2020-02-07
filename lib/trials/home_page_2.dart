import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:swipedetector/swipedetector.dart';

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
  final PageController ctrl = PageController(viewportFraction: 0.6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: 260,
        height: 500,
        margin: EdgeInsets.only(top: 45),
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(pizzas[index]),
            );
            // color: Colors.amber,
          },
          // scrollDirection: Axis.vertical,
          controller: ctrl,
          itemCount: pizzas.length,
        ),
      ),
    );
  }
}
