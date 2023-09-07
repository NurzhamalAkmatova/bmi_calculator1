import 'package:flutter/material.dart';

class RoundedBTN extends StatelessWidget {
  final IconData? icon;
  final Function()? onpress;
  final Color? color;

 const RoundedBTN({this.color, this.icon, this.onpress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 15),
      onPressed: onpress,
      elevation: 8,
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      shape: const CircleBorder(),
      fillColor: color,
    );
  }
}
