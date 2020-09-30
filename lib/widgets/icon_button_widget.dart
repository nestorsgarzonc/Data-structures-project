import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'iconLogin',
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 15),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: const FaIcon(FontAwesomeIcons.mountain, size: 30),
      ),
    );
  }
}
