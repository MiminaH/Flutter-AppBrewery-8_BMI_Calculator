import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // Key class used to keep track of state of Widget
  // especially useful when Widget is moving around in Widget-Tree (widgets are animated or scrolling on screen)
/* const ReusableCard({
    Key key,
  }) : super(key: key); */

  // instead will have a Constructor, to specify custom values for one of properties in reusable Widget
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  // final makes property immutable, meaning once color is set it can't be changed
  final Color colour;

  // child property to customize Reusable Card Widget
  final Widget cardChild;

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              // if we have BoxDecoration, then color property must be inside it.
              color: colour,
              borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
