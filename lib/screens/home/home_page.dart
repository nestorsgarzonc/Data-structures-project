import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = 'homePAge';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Dashboard',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
                CircleAvatar(
                  radius: 28,
                  child: Text('S', style: TextStyle(fontSize: 25)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(2, 3),
                    color: Colors.grey,
                  )
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: '¿Que necesitas?',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TitleCategoriesWidget(
              title: 'Tareas populares',
              onPress: () {},
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  final random = Random();
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextDouble(),
                          ),
                          Color.fromRGBO(
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextDouble(),
                          ),
                        ],
                        begin: Alignment.topLeft,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class TitleCategoriesWidget extends StatelessWidget {
  final String title;
  final Function onPress;

  const TitleCategoriesWidget({
    Key key,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        FlatButton(
          onPressed: () => onPress(),
          child: Text(
            'Ver mas',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
