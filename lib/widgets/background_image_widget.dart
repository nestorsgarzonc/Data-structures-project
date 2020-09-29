import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;
  final String imagePath;
  const BackgroundImageWidget({@required this.child, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
        child: child,
      ),
    );
  }
}
