import 'package:flutter/material.dart';

class AppBarWithBackButtonWidget extends StatelessWidget {
  final String text;
  const AppBarWithBackButtonWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          '$text',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        )
      ],
    );
  }
}
