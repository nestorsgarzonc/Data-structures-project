import 'package:flutter/material.dart';

class BackButtonAppBarWidget extends StatelessWidget {
  const BackButtonAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(200),
        ),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}
