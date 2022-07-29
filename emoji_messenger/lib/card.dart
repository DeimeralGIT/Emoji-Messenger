import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  Widget child;
  double? height;
  double? width;
  CardItem({
    required this.child,
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        elevation: 5,
        child: child,
      ),
    );
  }
}
