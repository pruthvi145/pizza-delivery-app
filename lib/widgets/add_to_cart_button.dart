import 'package:flutter/material.dart';
import 'package:pizza_delivery/helpers/styles.dart';

class AddToCartButton extends StatelessWidget {
  final Function? onTap;

  const AddToCartButton({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          gradient: Styles.addToCartButtonGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: Styles.addToCartaButtonShadow,
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
