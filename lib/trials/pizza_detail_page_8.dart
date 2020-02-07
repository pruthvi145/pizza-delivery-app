import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:pizza_delivery/data/demo_data.dart';
import 'package:pizza_delivery/data/topping.dart';

class PizzaDetailPage extends StatefulWidget {
  @override
  _PizzaDetailPageState createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage>
    with TickerProviderStateMixin {
  bool accepted = false;
  // String lastDragged;
  Set<Topping> addedToppings = {};
  List<Topping> avalibleToppings = [];

  AnimationController animationController;
  AnimationController animationController2;
  Animation scaleAnim;
  Animation scaleAnim2;

  @override
  void initState() {
    avalibleToppings = DemoData.toppings;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationController.addListener(() {
      setState(() {});
    });
    animationController2.addListener(() {
      setState(() {});
    });
    scaleAnim = Tween(begin: 1.0, end: 1.2).animate(animationController);
    scaleAnim2 = Tween(begin: 2.0, end: 1.0).animate(animationController2);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  void onDragStarted() {
    animationController2.reset();
    setState(() {
      accepted = false;
    });
  }

  void addTopping(Topping topping) {
    addedToppings.add(topping);
    // print(toppings);
  }

  void restToppings() {
    setState(() {
      addedToppings = {};
    });
    // print(toppings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 8"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.scale(
                  scale: scaleAnim.value,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100),
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
                ...addedToppings.map((tooping) {
                  return ToppingOnPizza(
                    toppingData: tooping,
                    shouldAnimate: true,
                  );
                }),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 100),
                  height: 250,
                  width: 250,
                  color: Colors.transparent,
                  child: DragTarget<Topping>(
                    onWillAccept: (d) {
                      // print("will");

                      animationController.forward();
                      return true;
                    },
                    onAccept: (d) {
                      addTopping(d);
                      // print(d);

                      // lastDragged = d;
                      animationController.reverse();
                      animationController2.forward();
                      accepted = true;
                    },
                    onLeave: (_) {
                      animationController.reverse();
                    },
                    builder: (context, data, antherdata) {
                      // print(data);
                      return Container();
                    },
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text("Reset"),
              onPressed: restToppings,
            ),
            // Text(addedToppings.toString()),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 60,
              child: ListView.builder(
                itemCount: avalibleToppings.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return BuildTopping(
                    toppingData: avalibleToppings[index],
                    onDragStarted: onDragStarted,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTopping extends StatelessWidget {
  final Widget image;
  final Topping toppingData;
  final Function onDragStarted;

  BuildTopping({this.onDragStarted, this.image, this.toppingData});

  @override
  Widget build(BuildContext context) {
    Widget toppingImage = Image.asset(
      toppingData.thumbImage,
      width: 25,
    );
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Draggable(
        feedback: toppingImage,
        child: toppingImage,
        ignoringFeedbackSemantics: false,
        maxSimultaneousDrags: 1,
        data: toppingData,
        onDragStarted: onDragStarted,
      ),
    );
  }
}

class ToppingOnPizza extends StatelessWidget {
  final Topping toppingData;
  final bool shouldAnimate;

  const ToppingOnPizza({this.shouldAnimate = false, this.toppingData});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 100),
      height: 250,
      width: 250,
      color: Colors.transparent,
      child: FlareActor(
        toppingData.flareAsset,
        animation: shouldAnimate ? "regular" : "idle",
        // color: Colors.white,
      ),
    );
  }
}
