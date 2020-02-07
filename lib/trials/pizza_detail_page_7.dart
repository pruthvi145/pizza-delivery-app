import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';

class PizzaDetailPage extends StatefulWidget {
  @override
  _PizzaDetailPageState createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage>
    with TickerProviderStateMixin {
  bool accepted = false;
  double scale = 1;
  String lastDragged;
  List<String> toppings = [];

  AnimationController animationController;
  AnimationController animationController2;
  Animation scaleAnim;
  Animation scaleAnim2;

  @override
  void initState() {
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
    super.dispose();
  }

  void onDragStarted() {
    animationController2.reset();
    setState(() {
      accepted = false;
    });
  }

  void addTopping(String name) {
    toppings.add(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 7"),
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 100),
                  height: 250,
                  width: 250,
                  color: Colors.transparent,
                  child: DragTarget<String>(
                    onWillAccept: (d) {
                      // print("will");

                      animationController.forward();
                      return true;
                    },
                    onAccept: (d) {
                      addTopping(d);
                      lastDragged = d;
                      animationController.reverse();
                      animationController2.forward();
                      accepted = true;
                    },
                    onLeave: (_) {
                      animationController.reverse();
                    },
                    builder: (context, data, antherdata) {
                      // print(data);
                      return accepted
                          ? Transform.scale(
                              scale: scaleAnim2.value,
                              child: ToppingOnPizza(
                                name: lastDragged ?? "",
                              ),
                            )
                          : Container();
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 60,
              child: ListView.builder(
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Topping(
                    name: "$index",
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

class Topping extends StatelessWidget {
  final Widget image;
  final String name;
  final Function onDragStarted;

  const Topping({this.onDragStarted, this.image, this.name});

  @override
  Widget build(BuildContext context) {
    Widget blueBox = Text(
      "$name",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
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
        feedback: Text(
          "$name",
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: blueBox,
        ignoringFeedbackSemantics: false,
        maxSimultaneousDrags: 1,
        data: "$name",
        onDragStarted: onDragStarted,
      ),
    );
  }
}

class ToppingOnPizza extends StatelessWidget {
  final Widget topping;
  //TODO: Remove
  final String name;

  const ToppingOnPizza({Key key, this.topping, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
