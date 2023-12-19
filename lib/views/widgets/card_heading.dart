import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHeadings extends StatelessWidget {
  double left;
  double top;
  String heading;
  double? fontsize;
  Color? textColor;
  CardHeadings({
    this.fontsize,
    required this.heading,
    required this.left,
    required this.top,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, top: top),
      child: Text(
        heading,
        style: GoogleFonts.poppins(
            color: textColor ?? Colors.white,
            fontSize: fontsize ?? 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
