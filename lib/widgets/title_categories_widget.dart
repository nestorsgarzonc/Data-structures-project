import 'package:flutter/material.dart';

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
