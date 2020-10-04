import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const String route = 'search_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Row(
            children: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios_rounded),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(2, 3),
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: '¿Que necesitas?'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
