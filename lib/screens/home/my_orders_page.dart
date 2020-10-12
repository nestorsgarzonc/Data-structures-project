import 'package:ed_project/models/profile_model.dart';
import 'package:intl/intl.dart';

import '../../providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userProviderView = Provider.of<ProfileProvider>(context).getUser;
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
            itemCount: userProviderView.lastTransactions.length,
            itemBuilder: (context, i) => _CustomCardItem(
              transaction: userProviderView.lastTransactions[i],
            ),
          ),
        )
      ],
    );
  }
}

class _CustomCardItem extends StatefulWidget {
  final LastTransaction transaction;
  const _CustomCardItem({Key key, @required this.transaction})
      : super(key: key);

  @override
  __CustomCardItemState createState() => __CustomCardItemState();
}

class __CustomCardItemState extends State<_CustomCardItem> {
  bool isTouched = false;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd – kk:mm');
    final date = dateFormat.format(widget.transaction.date);
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        leading: const CircleAvatar(radius: 25, child: Text('LG')),
        title: Text(
          '${widget.transaction.serviceName}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('$date'),
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
                      onTap: () => handleDialog(context, date, size),
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
        trailing: Icon(!isTouched
            ? Icons.arrow_downward_outlined
            : Icons.arrow_upward_outlined),
      ),
    );
  }

  Future handleDialog(BuildContext context, String date, Size size) {
    return showDialog(
      context: context,
      builder: (ctx) {
        final titleTextStyle = TextStyle(
          fontWeight: FontWeight.bold,
        );
        final items = [
          {
            'title': 'Nombre del servicio',
            'content': widget.transaction.serviceName
          },
          {'title': 'Categoria', 'content': widget.transaction.category},
          {
            'title': 'Descripcion del servicio',
            'content': widget.transaction.description
          },
          {'title': 'Freelancer', 'content': widget.transaction.freelancer},
          {'title': 'Fecha', 'content': date},
          {'title': 'Precio', 'content': widget.transaction.serviceName},
        ];
        return AlertDialog(
          title: Text('Descripcion de la orden:'),
          content: SizedBox(
            height: 200,
            width: size.width * 0.8,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${items[i]["title"]}: ', style: titleTextStyle),
                    Expanded(child: Text('${items[i]["content"]}')),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Salir', style: TextStyle(color: Colors.white)),
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        );
      },
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
