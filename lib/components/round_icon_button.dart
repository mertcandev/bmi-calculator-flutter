import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 0,
      disabledElevation: 6,
      onPressed: onPressed,
    );
  }
}