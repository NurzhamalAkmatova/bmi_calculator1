import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  final IconData? icon;
  final String? label;

  const IconWithLabel({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 80,
          ),
        ),
        Container(
          child: Text(
            label!,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
