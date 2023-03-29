import 'package:flutter/material.dart';

class Reusable_card extends StatelessWidget {
  //stateless widget can't be changed
  //done by flutter outline, it is created with extract widget
  Reusable_card(
      {required this.colour,
        required this.cardChild}); //curley braces if you want to refer to a name of a property, requiered will put a warning op roperties with null value
  final Color
  colour; //final value means it can only be set once and can't b changed

  // color can be final, not const because we can get value from anywhere
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour, // will pass value of Color
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
