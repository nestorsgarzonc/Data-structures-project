import '../../widgets/appbar_with_backbutton_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  static const route = 'EditProfilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: 'Editar perfil'),
            const _ButtonsEditProfile(),
          ],
        ),
      ),
    );
  }
}

class _ButtonsEditProfile extends StatelessWidget {
  const _ButtonsEditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
          //TODO: implement delete profile
          onPressed: () {},
          child: Text(
            'Eliminar perfil',
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          color: Colors.redAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(height: 15),
        RaisedButton(
          //TODO: implement update profile
          onPressed: () {},
          child: Text(
            'Guardar cambios',
            style: TextStyle(fontSize: 20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          color: Colors.blueAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
