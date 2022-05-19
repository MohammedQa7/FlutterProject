import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class customText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;

  customText({
    this.color = Colors.black,
    this.fontSize = 16,
    this.text = "",
    this.alignment = Alignment.topLeft,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
