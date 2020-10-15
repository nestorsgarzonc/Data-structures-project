import 'package:flutter/material.dart';

class BackgroundImageRoundedWidget extends StatelessWidget {
  final Widget child;
  final String imgRoute;
  final double opacity;
  final double percentHigh;
  final bool isExternalImage;
  static const _borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );

  const BackgroundImageRoundedWidget({
    Key key,
    @required this.child,
    this.imgRoute = 'assets/img/user_profile_wallpaper.jpg',
    this.opacity = 0.2,
    this.percentHigh = 0.38,
    this.isExternalImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * percentHigh,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        image: DecorationImage(
          image:
              isExternalImage ? NetworkImage(imgRoute) : AssetImage(imgRoute),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(opacity),
          borderRadius: _borderRadius,
        ),
        child: child,
      ),
    );
  }
}
