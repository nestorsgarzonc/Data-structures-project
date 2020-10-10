import 'dart:math';
import 'package:ed_project/widgets/popular_task_card_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListPage extends StatelessWidget {
  static const route = 'categories_list_page';
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Categorias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 20,
                ),
                itemCount: 25,
                itemBuilder: (context, index) => PopularTaskWidget(
                  onTap: () {},
                  text: 'Item #$index',
                  color: Color.fromRGBO(
                    random.nextInt(255),
                    random.nextInt(255),
                    random.nextInt(255),
                    1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
