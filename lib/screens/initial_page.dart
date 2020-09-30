import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../widgets/background_image_widget.dart';
import '../widgets/buttons_login_widget.dart';
import '../widgets/icon_button_widget.dart';
import './authentication/login_page.dart';
import './authentication/register_page.dart';

class InitialPage extends StatelessWidget {
  static const String route = 'initialPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageWidget(
        imagePath: 'assets/img/login.jpg',
        opacity: 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _TitleHeading(),
            SizedBox(),
            _InitialButtons(),
          ],
        ),
      ),
    );
  }
}

class _InitialButtons extends StatelessWidget {
  const _InitialButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsLogin(
          buttonColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.of(context).pushNamed(LoginPage.route),
          text: 'Inicia sesion',
          textColor: Colors.white,
        ),
        const SizedBox(height: 30),
        ButtonsLogin(
          textColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.of(context).pushNamed(RegisterPage.route),
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
          const IconButtonWidget(),
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
