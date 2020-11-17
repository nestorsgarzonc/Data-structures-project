import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../providers/profile_provider.dart';
import '../../screens/initial_page.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';

class EditProfilePage extends StatefulWidget {
  static const route = 'EditProfilePage';

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<ProfileProvider>(context, listen: false);
    final userP = userProv.getUser;
    ProfileModel user = userP;
    var gender = Gender.FEMALE;

    void handleDelete() {
      final res = userProv.deleteUser();
      if (!res) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Opps hubo un problema al eliminar el perfil'),
        ));
      } else {
        Navigator.of(context).pushReplacementNamed(InitialPage.route);
      }
    }

    void handleUpdate() {
      if (userProv.updateUser(user)) {
        Navigator.of(context).pop();
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Opps hubo un problema al actualizar el perfil'),
        ));
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: 'Editar perfil'),
            Expanded(
              child: Form(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    _CustomInputText(
                      icon: Icons.person,
                      label: 'Nombres',
                      initialValue: userP.name,
                      valueCallback: (String value) => user.name = value,
                    ),
                    _CustomInputText(
                      icon: Icons.person,
                      label: 'Apellidos',
                      initialValue: userP.lastName,
                      valueCallback: (String value) => user.lastName = value,
                    ),
                    _CustomInputText(
                      icon: Icons.room_preferences_rounded,
                      label: 'Nombre de usuario',
                      initialValue: userP.username,
                      valueCallback: (String value) => user.username = value,
                    ),
                    _CustomInputText(
                      icon: Icons.email,
                      label: 'Correo electronico',
                      initialValue: userP.email,
                      valueCallback: (String value) => user.email = value,
                    ),
                    _CustomInputText(
                      icon: Icons.vpn_key,
                      label: 'Contraseña',
                      initialValue: userP.password,
                      valueCallback: (String value) => user.password = value,
                      showText: false,
                    ),
                    _CustomInputText(
                      icon: Icons.location_on,
                      label: 'Ubicacion',
                      initialValue: userP.location,
                      valueCallback: (String value) => user.location = value,
                    ),
                    Row(
                      children: [
                        Radio(
                          //TODO: FIX BUTTON
                          value: Gender.MALE,
                          groupValue: gender,
                          onChanged: (v) => setState(() {
                            print(v);
                            gender = v;
                          }),
                        ),
                        Radio(
                          value: Gender.FEMALE,
                          groupValue: gender,
                          onChanged: (v) => setState(() {
                            print(v);
                            gender = v;
                          }),
                        ),
                      ],
                    ),
                    _CustomInputText(
                      icon: Icons.photo_filter,
                      label: 'Link foto perfil',
                      initialValue: userP.avatarUrl,
                      valueCallback: (String value) => user.avatarUrl = value,
                    ),
                  ],
                ),
              ),
            ),
            _ButtonsEditProfile(
              handleDelete: handleDelete,
              handleUpdate: handleUpdate,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _CustomInputText extends StatelessWidget {
  final Function valueCallback;
  final String label;
  final String initialValue;
  final IconData icon;
  final bool showText;

  const _CustomInputText({
    Key key,
    @required this.valueCallback,
    @required this.label,
    @required this.icon,
    @required this.initialValue,
    this.showText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) => valueCallback(value),
          cursorColor: Theme.of(context).primaryColor,
          initialValue: initialValue,
          obscureText: !showText,
          decoration: InputDecoration(
            labelText: '$label',
            prefixIcon: Icon(icon),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _ButtonsEditProfile extends StatelessWidget {
  final Function handleDelete;
  final Function handleUpdate;
  const _ButtonsEditProfile({
    Key key,
    @required this.handleDelete,
    @required this.handleUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () => handleDelete(),
          child: Text('Eliminar perfil', style: TextStyle(fontSize: 16)),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          color: Colors.redAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        RaisedButton(
          onPressed: () => handleUpdate(),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          color: Colors.blueAccent,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text('Guardar cambios', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
