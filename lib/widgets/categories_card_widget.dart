import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Function onTap;
  final String name;
  final int frelancersCounter;
  final String imageUrl;
  final bool isExternal;

  const CategoriesWidget({
    Key key,
    @required this.onTap,
    @required this.name,
    @required this.frelancersCounter,
    this.imageUrl = 'assets/img/categories_cleaning.jpg',
    this.isExternal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isExternal
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: 160,
                      width: 300,
                    )
                  : Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      height: 160,
                      width: 300,
                    ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      '$frelancersCounter frelancers',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
