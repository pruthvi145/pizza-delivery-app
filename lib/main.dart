import 'package:flutter/material.dart';

import 'home_page_6_3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delievery Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF522921),
        fontFamily: "ITC Avant Garde Gothic Std",
      ),
      home: HomePage(),
    );
  }
}
