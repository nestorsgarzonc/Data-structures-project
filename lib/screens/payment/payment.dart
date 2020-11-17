import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/profile_provider.dart';
import '../home/main_page.dart';

class PaymentPage extends StatelessWidget {
  static const String route = 'paymentPage';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final service = provider.getSelectedService;
    final freelancer = provider.getSelectedFreelancer;
    const titleTextStyle = TextStyle(color: Colors.white, fontSize: 24);
    const contentTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 30,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Confirmar orden',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Haz el pago y muy pronto podrás disfrutar de los beneficios',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.blueAccent.withOpacity(0.7),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text('Tienes que pagar:', style: titleTextStyle),
                    const SizedBox(height: 10),
                    Text('\$${service.price}', style: contentTextStyle),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white, thickness: 2),
                    const SizedBox(height: 20),
                    const Text('Nombre servicio:', style: titleTextStyle),
                    const SizedBox(height: 10),
                    Text(service.serviceName, style: contentTextStyle),
                    const SizedBox(height: 20),
                    const Text('Freelancer:', style: titleTextStyle),
                    const SizedBox(height: 10),
                    Text(freelancer.name, style: contentTextStyle),
                    const SizedBox(height: 20),
                    const Text('Telefono:', style: titleTextStyle),
                    const SizedBox(height: 10),
                    const Text('322 5846354', style: contentTextStyle),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
                provider.addNewService(
                  freelancer.name,
                  service.serviceName,
                  service.category,
                  service.price,
                );
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    actions: [
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pushNamed(MainPage.route),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                    content: const Text('Transferencia creada correctamente'),
                  ),
                  barrierDismissible: false,
                );
              },
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Theme.of(context).primaryColor,
              child: const Text(
                'Pagar',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
