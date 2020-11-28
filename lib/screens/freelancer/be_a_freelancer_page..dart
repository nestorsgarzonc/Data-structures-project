import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/profile_provider.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';
import '../home/main_page.dart';
import './../../models/freelancer_model.dart';
import './../../providers/freelancer_provider.dart';

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
                  const Text('Sigue las siguientes recomendaciones antes de comenzar:'),
                  const SizedBox(height: 8),
                  ..._recomendationsList.map((e) => _ListRecomendations(title: e)).toList()
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: RaisedButton(
                onPressed: () => _handleBeFreelancerButton(context),
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleBeFreelancerButton(BuildContext context) {
    final _currentUser = Provider.of<ProfileProvider>(context, listen: false).getUser;
    final _freelancer = FreelancerModel(
      name: _currentUser.name,
      lastName: _currentUser.lastName,
      username: _currentUser.username,
      location: _currentUser.location,
      gender: _currentUser.gender,
      avatarUrl: _currentUser.avatarUrl,
      services: [],
    );
    Provider.of<FreelancerProvider>(context, listen: false).userToFreelancer(_freelancer);
    Provider.of<ProfileProvider>(context, listen: false).setUserToFreelancer();
    Navigator.of(context).pushReplacementNamed(MainPage.route);
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
          const SizedBox(width: 10),
          Flexible(child: Text(title))
        ],
      ),
    );
  }
}
