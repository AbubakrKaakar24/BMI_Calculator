import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.child});
  final Widget child;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(13.5)),
      margin: const EdgeInsets.all(15),
    );
  }
}
