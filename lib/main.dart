import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: Center(
          child: Carrousel(),
        ),
      ),
    );
  }
}

class Carrousel extends StatelessWidget {
  const Carrousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.deepPurpleAccent,
          width: 100,
          height: 220,
          child: Text('Hello chicos '),
        ),
        Container(
          color: Colors.deepPurpleAccent,
          width: 100,
          height: 220,
          child: Text('Hello chicos '),
        ),
        Container(
          color: Colors.deepPurpleAccent,
          width: 100,
          height: 220,
          child: Text('Hello chicos '),
        ),
      ],
    );
  }
}
