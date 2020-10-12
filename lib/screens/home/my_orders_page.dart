import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: size.width * 0.4, top: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text(
            'Tus ordenes y servicios',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) => _CustomCardItem(index: index),
          ),
        )
      ],
    );
  }
}

class _CustomCardItem extends StatefulWidget {
  final int index;
  const _CustomCardItem({Key key, @required this.index}) : super(key: key);

  @override
  __CustomCardItemState createState() => __CustomCardItemState();
}

class __CustomCardItemState extends State<_CustomCardItem> {
  bool isTouched = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        leading: const CircleAvatar(radius: 25, child: Text('LG')),
        title: Text(
          'Servicio #${widget.index}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text('20/05/2020'),
            if (isTouched)
              SizedBox(
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ButtomListOrders(
                      textColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                      text: 'Detalles',
                      onTap: () {},
                    ),
                    _ButtomListOrders(
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      text: 'Ayuda',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
          ],
        ),
        onTap: () => setState(() => isTouched = !isTouched),
        trailing: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class _ButtomListOrders extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color textColor;
  final Color backgroundColor;

  const _ButtomListOrders({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.textColor,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: backgroundColor,
      onPressed: () => onTap(),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
