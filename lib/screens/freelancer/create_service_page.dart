import 'package:flutter/material.dart';
import 'package:waffly/widgets/appbar_with_backbutton_widget.dart';

class CreateServicePage extends StatelessWidget {
  static const String route = 'CreateServicePage';

  //TODO: finish form
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
                children: [
                  const Text(
                    'Hola,\nEstas a punto de crear un servicio',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
