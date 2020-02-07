import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_delivery/provider/current_pizza_index_notifier.dart';
import './offset_notifier.dart';
import 'package:provider/provider.dart';
// import 'package:swipedetector/swipedetector.dart';
import 'dart:math' as math;

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController ctrl =
      PageController(initialPage: 1, viewportFraction: 0.6);

  void scalePizzas(int index, OffsetNotifier notifier) {
    int _currentIndex =
        Provider.of<CurrentPizzaIndexNotifier>(context).currentIndex;
    if (_currentIndex == index) {}
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(ctrl),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: <Widget>[
            Opacity(
              opacity: 0.2,
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 200),
                height: 500,
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 500,
              margin: EdgeInsets.only(top: 200),
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  Provider.of<CurrentPizzaIndexNotifier>(context).currentIndex =
                      index;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<OffsetNotifier>(
                    builder: (context, notifier, child) {
                      // print("$index: ${notifier.page}");
                      print(0.2 * notifier.page);
                      Offset offset = Offset(0, 0);
                      if (index == notifier.page.floor()) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Transform.translate(
                              offset: offset,
                              child: Transform.scale(
                                scale: math.max(
                                    0.8,
                                    1 -
                                        (notifier.page -
                                            notifier.page.floor())),
                                child: child,
                              ),
                            ),
                          ],
                        );
                      } else if (index == notifier.page.floor() + 1) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Transform.translate(
                              offset: offset,
                              child: Transform.scale(
                                scale: math.min(
                                    1,
                                    0.8 +
                                        notifier.page -
                                        notifier.page.floor()),
                                child: child,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(0, 0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: child,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(pizzas[index]),
                    ),
                  );
                  // color: Colors.amber,
                },
                // scrollDirection: Axis.vertical,
                controller: ctrl,
                itemCount: pizzas.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
