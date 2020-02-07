import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pizza_delivery/helpers/styles.dart';
import 'package:pizza_delivery/provider/current_pizza_index_notifier.dart';

import 'package:pizza_delivery/widgets/custom_tag.dart';
import 'package:pizza_delivery/widgets/home_widgets/home_header.dart';
import 'package:pizza_delivery/widgets/pizza_palate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentPizzaIndexNotifier(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 45),
            decoration: BoxDecoration(gradient: Styles.backgroundGradient),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeHeader(),
                SizedBox(height: 30),
                CustomTag(),
                SizedBox(height: 20),
                PizzaPalate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
