import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  Widget child;
  Color color;
  Alignment alignment;
  Function()? onTap;
  SectionContainer({
    required this.child,
    required this.color,
    this.alignment = Alignment.center,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Card(
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
      ),
    );
  }
}
