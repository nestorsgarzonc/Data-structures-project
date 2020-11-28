import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waffly/models/freelancer_model.dart';
import 'package:waffly/models/profile_model.dart';
import 'package:waffly/providers/freelancer_provider.dart';
import 'package:waffly/providers/profile_provider.dart';
import 'package:waffly/widgets/dialogs/dialog_widget.dart';
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
              } else if (double.tryParse(value).ceil() <= 0) {
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

  Future<void> _handleSubmit(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      CustomDialogs.showDialogAlert(
        context,
        'Error',
        'Verifica tus datos y vuelve a intentarlo 😁',
      );
      return;
    }
    //TODO: Add description
    final newService = Service(
      category: _categoryController.text,
      date: DateTime.now(),
      imageUrl: _urlImgController.text,
      numberStars: 0,
      price: int.parse(_priceController.text).round(),
      serviceName: _serviceNameController.text,
    );
    final bool res =
        Provider.of<FreelancerProvider>(context, listen: false).createService(newService);
    if (res) {
      await CustomDialogs.showDialogAlert(
        context,
        'Servicio creado',
        'Felicitaciones servicio creado exitosamente 😁',
      );
      Navigator.of(context).pop();
    } else {
      CustomDialogs.showDialogAlert(
        context,
        'Error',
        'Ha ocurrido un error, vuelve a intentarlo',
      );
    }
  }

  InputDecoration _buildInputDecoration(String text) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: text,
      labelStyle: const TextStyle(fontSize: 15),
    );
  }
}
