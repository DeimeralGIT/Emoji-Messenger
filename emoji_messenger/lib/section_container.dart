import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  Widget child;
  Color color;
  Alignment alignment;
  SectionContainer(
      {required this.child,
      required this.color,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      elevation: 5,
      child: Container(
        alignment: alignment,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
