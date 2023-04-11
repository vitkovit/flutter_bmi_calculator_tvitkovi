import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //stateless widget can't be changed
  //done by flutter outline, it is created with extract widget
  const ReusableCard(
      {super.key, required this.colour,
        required this.cardChild, required this.onPress}); //curley braces if you want to refer to a name of a property, required will put a warning op properties with null value
  final Color
  colour; //final value means it can only be set once and can't b changed
  // color can be final, not const because we can get value from anywhere
  final Widget cardChild;
  final VoidCallback onPress; //cant be Function, use VoidCallback

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour, // will pass value of Color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
