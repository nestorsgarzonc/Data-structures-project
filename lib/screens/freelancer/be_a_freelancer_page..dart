import 'package:flutter/material.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';

class BeAFreelancerPage extends StatelessWidget {
  static const String route = 'BeAFreelancerPage';
  final List<String> _recomendationsList = [
    'Se puntual',
    'Seguir las medidas de covid-19',
    'Al comenzar y al terminar el servicio marcalo en la app',
    'Recuerda comunicarte con el cliente antes de realizar el servicio',
    'Cualquier problema con el pago contactarse con servicio al usuario',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: ''),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Image.asset(
                    'assets/img/be_freelancer_image.png',
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    'Hola, felicitaciones! \nEstas a punto de ser un freelancer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Text('Sigue las siguientes recomendaciones antes de comenzar:'),
                  SizedBox(height: 8),
                  ..._recomendationsList.map((e) => _ListRecomendations(title: e)).toList()
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: RaisedButton(
                //TODO: implemnt on pressed
                onPressed: () {},
                child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListRecomendations extends StatelessWidget {
  final String title;

  const _ListRecomendations({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(width: 10),
          Flexible(child: Text(title))
        ],
      ),
    );
  }
}
