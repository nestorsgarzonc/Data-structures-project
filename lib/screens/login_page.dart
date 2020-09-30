import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/background_image_widget.dart';
import '../widgets/buttons_login_widget.dart';
import '../widgets/icon_button_widget.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundImageWidget(
        imagePath: 'assets/img/login_2.jpg',
        opacity: 0.05,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              top: size.height * 0.1,
              left: 20,
              child: const TitleHeaderWidget(),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              height: size.height * 0.6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  children: [
                    const Text(
                      'Crea una cuenta',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              labelText: 'Correo electronico',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            cursorColor: Theme.of(context).primaryColor,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'Usuario',
                              prefixIcon: Icon(Icons.account_circle),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              labelText: 'Contraseña',
                              prefixIcon: Icon(Icons.vpn_key),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ButtonsLogin(
                      buttonColor: Theme.of(context).primaryColor,
                      onPressed: () {},
                      text: 'Registrarte',
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    const _SocialNetworksIcons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialNetworksIcons extends StatelessWidget {
  const _SocialNetworksIcons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.google, color: Colors.black38),
        ),
        FlatButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
        ),
        FlatButton(
          onPressed: () {},
          child:
              const FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
        ),
      ],
    );
  }
}

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IconButtonWidget(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: const Text(
            'Bienvenido',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 3,
                shadows: [Shadow(color: Colors.grey, blurRadius: 1)]),
          ),
        )
      ],
    );
  }
}
