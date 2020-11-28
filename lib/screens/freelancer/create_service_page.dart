import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waffly/models/profile_model.dart';
import 'package:waffly/providers/profile_provider.dart';
import 'package:waffly/screens/profile/user_profile_page.dart';
import 'package:waffly/widgets/buttons_login_widget.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';

class CreateServicePage extends StatelessWidget {
  static const String route = 'CreateServicePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: 'Crea un servicio'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: const [
                  Text(
                    'Hola,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Para publicar un servicio llena el siguiente formulario',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  _FormCreateService()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormCreateService extends StatefulWidget {
  const _FormCreateService({Key key}) : super(key: key);

  @override
  __FormCreateServiceState createState() => __FormCreateServiceState();
}

class __FormCreateServiceState extends State<_FormCreateService> {
  ProfileModel user;

  final _formKey = GlobalKey<FormState>();
  final _serviceNameController = TextEditingController();
  final _urlImgController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  //TODO: finish form
  //TODO: add user img, user name

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = Provider.of<ProfileProvider>(context).getUser;
  }

  @override
  Widget build(BuildContext context) {
    final _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.blue;
        }
        return Theme.of(context).primaryColor;
      }),
    );

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: _serviceNameController,
            decoration: _buildInputDecoration('Nombre del servicio'),
            validator: (String value) => value.isNotEmpty ? null : 'Oops Verifica el nombre',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _locationController,
            decoration: _buildInputDecoration('Ubicacion'),
            keyboardType: TextInputType.streetAddress,
            validator: (String value) => value.isNotEmpty ? null : 'Oops Verifica la ubicación',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _urlImgController,
            decoration: _buildInputDecoration('Link imagen de banner'),
            keyboardType: TextInputType.url,
            validator: (String value) => value.isNotEmpty ? null : 'Oops Verifica el link',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _categoryController,
            decoration: _buildInputDecoration('Categoria'),
            validator: (String value) => value.isNotEmpty ? null : 'Oops Verifica el link',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _descriptionController,
            decoration: _buildInputDecoration('Descripcion del servicio'),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            validator: (String value) => value.isNotEmpty ? null : 'Oops Verifica la descripcion',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _priceController,
            decoration: _buildInputDecoration('Precio'),
            keyboardType: TextInputType.number,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Oops Verifica el precio';
              } else if (int.tryParse(value) <= 0) {
                return 'El precio tiene que ser mayor que cero';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => _handleSubmit(context),
              style: _buttonStyle,
              child: const Text('Crear servicio'),
            ),
          )
        ],
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Verifica tus datos y vuelve a intentarlo 😁'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Exit'),
            )
          ],
        ),
      );
      return;
    }
    print(user.name);
    print(_serviceNameController.text);
  }

  InputDecoration _buildInputDecoration(String text) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: text,
      labelStyle: const TextStyle(fontSize: 15),
    );
  }
}
