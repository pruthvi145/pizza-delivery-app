import 'package:flutter/material.dart';
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
