import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ButtonsLogin extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Function onPressed;

  const ButtonsLogin({
    Key key,
    @required this.text,
    @required this.textColor,
    @required this.buttonColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: 50,
      child: ElasticInLeft(
        delay: const Duration(milliseconds: 100),
        child: RaisedButton(
          elevation: 4,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () => onPressed(),
          child: Text(text, style: TextStyle(fontSize: 18, color: textColor)),
        ),
      ),
    );
  }
}
