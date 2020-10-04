import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/index_homepage_provider.dart';
import '..//home/home_page.dart';
import '..//home/my_orders_page.dart';
import '..//home/search_page.dart';

class MainPage extends StatelessWidget {
  static const String route = 'mainPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _CustomNavigationBarWidget(),
      floatingActionButton: const _CustomFloatingActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(SearchPage.route),
      child: const Icon(Icons.search),
    );
  }
}

class _CustomNavigationBarWidget extends StatelessWidget {
  const _CustomNavigationBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: Provider.of<IndexHomePageProvider>(context).index,
      onTap: (value) =>
          Provider.of<IndexHomePageProvider>(context, listen: false).index =
              value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_rounded),
          label: 'Mis ordenes',
        ),
      ],
    );
  }
}
