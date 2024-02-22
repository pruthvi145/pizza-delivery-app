import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_delivery/helpers/styles.dart';
import 'package:pizza_delivery/widgets/add_to_cart_button.dart';
import 'package:pizza_delivery/widgets/custom_radio.dart';

import 'data/demo_data.dart';
import 'data/pizza.dart';
import 'data/topping.dart';

class PizzaDetailPage extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetailPage(this.pizza);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: h),
          decoration: BoxDecoration(gradient: Styles.backgroundGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              HomeHeader(pizza),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                child: PizzaPalate(pizza),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  final Pizza pizza;

  const HomeHeader(this.pizza);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Image.asset('assets/images/back_arrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              pizza.name!,
              style: TextStyle(
                fontFamily: 'IntroHeadB',
                fontSize: 33,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {}, icon: Image.asset('assets/images/cart.png')),
      ],
    );
  }
}

class PizzaPalate extends StatefulWidget {
  final Pizza pizza;
  const PizzaPalate(this.pizza);

  @override
  _PizzaPalateState createState() => _PizzaPalateState();
}

class _PizzaPalateState extends State<PizzaPalate>
    with SingleTickerProviderStateMixin {
  Set<Topping> addedToppings = {};
  List<Topping> _avalibleToppings = [];
  AnimationController? _animationController;
  Animation? _scaleAnim;

  @override
  void initState() {
    _avalibleToppings = DemoData.toppings;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController!.addListener(() {
      setState(() {});
    });
    _scaleAnim = Tween(begin: 1.0, end: 1.1).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void onDragStarted() {
    _animationController!.reset();
  }

  void addTopping(Topping topping) {
    addedToppings.add(topping);
    widget.pizza.toppings = addedToppings;
  }

  Widget _buildPizzaPalateBack() {
    return Container(
      margin: EdgeInsets.only(top: 80),
      width: 230 * 2.0,
      height: 520,
      decoration: BoxDecoration(
        gradient: Styles.pizzaPalateBackgroundGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: Styles.pizzaPalateShadow,
      ),
    );
  }

  Widget _buildPizzaPalateFront(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.scale(
              scale: _scaleAnim!.value,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/wooden_plate2.png',
                    width: 260,
                  ),
                  Image.asset(
                    widget.pizza.image!,
                    width: 230,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            ...{
              ...widget.pizza.toppings.map((tooping) {
                return ToppingOnPizza(
                  toppingData: tooping,
                  shouldAnimate: true,
                );
              }),
            },
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 250,
              color: Colors.transparent,
              child: DragTarget<Topping>(
                onWillAcceptWithDetails: (_) {
                  _animationController?.forward();
                  return true;
                },
                onAcceptWithDetails: (DragTargetDetails<Topping> details) {
                  addTopping(details.data);
                  _animationController?.reverse();
                },
                onLeave: (_) {
                  _animationController?.reverse();
                },
                builder: (context, data, antherdata) {
                  // print(data);
                  return Container();
                },
              ),
            ),
          ],
        ),
        // SizedBox(height: 30),
        HomePizzaDetails(
          pizza: widget.pizza,
          avalibleToppings: _avalibleToppings,
          onDragStarted: onDragStarted,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.pizza);
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
  final Pizza? pizza;
  final List<Topping>? avalibleToppings;
  final Function? onDragStarted;
  const HomePizzaDetails(
      {Key? key, this.pizza, this.avalibleToppings, this.onDragStarted})
      : super(key: key);

  @override
  _HomePizzaDetailsState createState() => _HomePizzaDetailsState();
}

class _HomePizzaDetailsState extends State<HomePizzaDetails>
    with SingleTickerProviderStateMixin {
  AnimationController? _anim;

  double? _oldPrice;
  @override
  void initState() {
    _anim = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _anim!.addListener(() => setState(() {}));
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    double price = widget.pizza!.getTotal();
    if (_oldPrice != price) {
      _anim!.forward(from: 0);
    }
    _oldPrice = price;
    return Column(
      children: <Widget>[
        buildPizzaPrice(context, price),
        CustomRadio(),
        SizedBox(height: 25),
        Text("Toppings (Must be 2)"),
        SizedBox(height: 25),
        Container(
          height: 60,
          child: ListView.builder(
            itemCount: widget.avalibleToppings!.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return BuildTopping(
                toppingData: widget.avalibleToppings![index],
                onDragStarted: widget.onDragStarted!,
              );
            },
          ),
        ),
        SizedBox(
          height: 60,
        ),
        // FlatButton(
        //   child: Text("Reset"),
        //   onPressed: widget.pizza.resetToppings,
        // ),
        AddToCartButton(
          onTap: () {},
        ),
      ],
    );
  }
}

class BuildTopping extends StatelessWidget {
  final Widget? image;
  final Topping? toppingData;
  final Function? onDragStarted;

  BuildTopping({this.onDragStarted, this.image, this.toppingData});

  @override
  Widget build(BuildContext context) {
    Widget toppingImage = Image.asset(
      toppingData!.thumbImage!,
      width: 45,
    );
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFDF0CF),
      ),
      child: Draggable(
        affinity: Axis.vertical,
        feedback: toppingImage,
        child: toppingImage,
        ignoringFeedbackSemantics: false,
        maxSimultaneousDrags: 1,
        data: toppingData,
        onDragStarted: onDragStarted as void Function(),
      ),
    );
  }
}

class ToppingOnPizza extends StatelessWidget {
  final Topping? toppingData;
  final bool shouldAnimate;

  const ToppingOnPizza({this.shouldAnimate = false, this.toppingData});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      color: Colors.transparent,
      child: FlareActor(
        toppingData!.flareAsset,
        animation: shouldAnimate ? "regular" : "idle",
        artboard: toppingData!.flareArtboard,
        // color: Colors.white,
      ),
    );
  }
}
