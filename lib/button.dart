import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTap;

  Button({this.color, this.textColor, this.buttonText = '', this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor, fontSize: 20),
                ),
              ),
            )),
      ),
    );
  }
}
