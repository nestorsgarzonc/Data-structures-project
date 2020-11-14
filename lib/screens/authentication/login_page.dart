import 'package:ed_project/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../screens/home/main_page.dart';
import '../../widgets/background_image_widget.dart';
import '../../widgets/buttons_login_widget.dart';
import '../../widgets/icon_button_widget.dart';

class LoginPage extends StatelessWidget {
  static const String route = 'loginPage';

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
              child: const _TitleHeaderWidget(),
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
                child: _LoginBodyWodget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginBodyWodget extends StatefulWidget {
  @override
  __LoginBodyWodgetState createState() => __LoginBodyWodgetState();
}

class __LoginBodyWodgetState extends State<_LoginBodyWodget> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      final bool res =
          Provider.of<ProfileProvider>(context, listen: false).login(_email, _password);
      if (!res) {
        Scaffold.of(context)
            .showSnackBar(const SnackBar(content: Text('Credenciales incorrectas')));
      } else {
        Navigator.of(context).pushReplacementNamed(MainPage.route);
      }
    }

    return ListView(
      children: [
        const Text(
          '¡Hola de nuevo!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(height: 25),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 5),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Theme.of(context).primaryColor,
                onChanged: (value) => _email = value,
                decoration: const InputDecoration(
                  labelText: 'Correo electronico',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (s) => _password = s,
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
          onPressed: handleSubmit,
          text: 'Iniciar sesion',
          textColor: Colors.white,
        ),
        const SizedBox(height: 10),
        const _SocialNetworksIcons(),
      ],
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
          child: const FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
        ),
      ],
    );
  }
}

class _TitleHeaderWidget extends StatelessWidget {
  const _TitleHeaderWidget({Key key}) : super(key: key);

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
