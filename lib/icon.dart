import 'package:flutter/material.dart';
import 'constants.dart';

class CardChild extends StatelessWidget {
  CardChild({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.white,
        ),        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style:kLabelTextStyle, ),      ],
    );
  }}