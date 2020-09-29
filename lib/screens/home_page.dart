import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/background_image_widget.dart';
import '../widgets/buttons_login_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(
        imagePath: 'assets/img/login.jpg',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _TitleHeading(),
            SizedBox(),
            _HomeButtons(),
          ],
        ),
      ),
    );
  }
}

class _HomeButtons extends StatelessWidget {
  const _HomeButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsLogin(
          buttonColor: Theme.of(context).primaryColor,
          onPressed: () {},
          text: 'Inicia sesion',
          textColor: Colors.white,
        ),
        const SizedBox(height: 30),
        ButtonsLogin(
          textColor: Theme.of(context).primaryColor,
          onPressed: () {},
          text: 'Registrate',
          buttonColor: Colors.white,
        ),
      ],
    );
  }
}

class _TitleHeading extends StatelessWidget {
  const _TitleHeading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 15, height: 50),
              const Text(
                "Be",
                style: TextStyle(fontSize: 43.0, color: Colors.white),
              ),
              const SizedBox(width: 20, height: 100),
              RotateAnimatedTextKit(
                repeatForever: true,
                onTap: () {},
                text: const ["AWESOME", "OPTIMISTIC", "DIFFERENT"],
                alignment: Alignment.topCenter,
                duration: const Duration(seconds: 3),
                textStyle: TextStyle(
                  fontSize: 40.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
