import 'package:flutter/material.dart';

class PizzaGeometry {
  final Offset position;
  final double scale;

  const PizzaGeometry(
      [this.position = const Offset(0.0, 0.0), this.scale = 1.0]);

  factory PizzaGeometry.center() {
    return PizzaGeometry(Offset(0.0, 0.0), 1.0);
  }
  factory PizzaGeometry.left() {
    return PizzaGeometry(Offset(-210, 250), 0.6);
  }
  factory PizzaGeometry.right() {
    return PizzaGeometry(Offset(210, 250), 0.6);
  }
  factory PizzaGeometry.prev() {
    return PizzaGeometry(Offset(-310, 250), 0.6);
  }
  factory PizzaGeometry.next() {
    return PizzaGeometry(Offset(310, 250), 0.6);
  }

  PizzaGeometry operator -(PizzaGeometry other) {
    return PizzaGeometry(position - other.position, scale - other.scale);
  }

  PizzaGeometry operator +(PizzaGeometry other) {
    return PizzaGeometry(other.position + position, other.scale + scale);
  }

  PizzaGeometry operator *(double oprand) {
    return PizzaGeometry(position * oprand, scale * oprand);
  }

  @override
  String toString() {
    return "Position: $position, Scale: $scale";
  }
}
