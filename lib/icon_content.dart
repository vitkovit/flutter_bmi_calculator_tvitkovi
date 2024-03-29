import 'package:flutter/material.dart';
import 'constants.dart';

//
// const labelTextStyle = TextStyle(
//   fontSize: 18.0,
//   color: Color(0xFF8D8E98),
// );
class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          // final IconData can be checked if you hold mouse on Icon propert
          icon,
          size: 100.0,
          color: Colors.white38,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle
          ),
      ],
    );
  }
}
