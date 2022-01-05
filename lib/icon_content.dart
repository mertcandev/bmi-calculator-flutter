import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const labelTextStyle = TextStyle(fontSize: 18, color: Colors.white);

class IconContent extends StatelessWidget {
  final String cardText;
  final IconData cardIcon;

  IconContent({@required this.cardIcon, @required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon, color: Colors.white, size: 90),
        Text(cardText, style: GoogleFonts.lato(textStyle: labelTextStyle)),
        SizedBox(height: 15),
      ],
    );
  }
}
