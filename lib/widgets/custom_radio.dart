import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  PizzaSize selectedSize = PizzaSize.M;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...PizzaSize.values.toList().map((PizzaSize state) {
          return RadioItem(
            text: state.toString().split(".")[1],
            isSelected: state == selectedSize,
            onTap: () {
              setState(() {
                selectedSize = state;
              });
            },
          );
        }),
      ],
    );
  }
}

class RadioItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const RadioItem({Key key, this.text, this.isSelected = false, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child = isSelected
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Text(
              text,
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
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 45,
            width: 45,
            alignment: Alignment.center,
            // color: Colors.red,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF522a21),
              ),
            ),
          );
    return InkWell(
      child: child,
      onTap: onTap,
      splashColor: Colors.red,
    );
  }
}

enum PizzaSize { S, M, L }
