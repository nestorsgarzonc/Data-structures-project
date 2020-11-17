import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/index_homepage_provider.dart';
import '../home/home_page.dart';
import '../home/my_orders_page.dart';
import '../home/search_page.dart';

class MainPage extends StatelessWidget {
  static const String route = 'mainPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _CustomNavigationBarWidget(),
      floatingActionButton: const _CustomFloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: IndexedStack(
            index: Provider.of<IndexHomePageProvider>(context).index,
            children: [
              HomePage(),
              MyOrdersPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomFloatingActionButtonWidget extends StatelessWidget {
  const _CustomFloatingActionButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius:1, color: Colors.grey)
        ]
      ),
      height: 50,
      width: 140,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Theme.of(context).primaryColor,
        //TODO: replace onpress to service creation
        //TODO: add condition to render when the usser is freelancer
        onPressed: () => Navigator.of(context).pushNamed(SearchPage.route),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Crea un\nservicio', style: TextStyle(color: Colors.white)),
            SizedBox(width: 10),
            Icon(Icons.create, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _CustomNavigationBarWidget extends StatelessWidget {
  const _CustomNavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Provider.of<IndexHomePageProvider>(context).index,
      onTap: (value) => Provider.of<IndexHomePageProvider>(context, listen: false).index = value,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Mis ordenes',
        ),
      ],
    );
  }
}
