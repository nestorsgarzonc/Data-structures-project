import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  static const String route = 'paymentPage';
  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Has el pago y muy pronto podras disfrutar de los beneficios',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).primaryColor,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 20),
                    Text('Tienes que pagar:', style: titleTextStyle),
                    SizedBox(height: 10),
                    Text('\$20000', style: contentTextStyle),
                    SizedBox(height: 20),
                    Divider(color: Colors.white, thickness: 2),
                    SizedBox(height: 20),
                    Text('Nombre servicio:', style: titleTextStyle),
                    SizedBox(height: 10),
                    Text('Limpieza', style: contentTextStyle),
                    SizedBox(height: 20),
                    Text('Freelancer:', style: titleTextStyle),
                    SizedBox(height: 10),
                    Text('Luis Gonzalez', style: contentTextStyle),
                    SizedBox(height: 20),
                    Text('Telefono:', style: titleTextStyle),
                    SizedBox(height: 10),
                    Text('322 5846354', style: contentTextStyle),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {},
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
