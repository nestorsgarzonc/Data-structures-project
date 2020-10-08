import 'package:flutter/material.dart';
import '../../widgets/background_image_rounded.dart';

class UserProfilePage extends StatelessWidget {
  static const String route = 'profilePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackgroundImageRoundedWidget(
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Sebastian Garzon',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          ' Bogota, Colombia',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const _ListItemsUserProfileWidget()
        ],
      ),
    );
  }
}

class _ListItemsUserProfileWidget extends StatelessWidget {
  static const _listItems = [
    {
      'title': 'Editar perfil',
      'route': '',
      'icon': Icons.person,
    },
    {
      'title': 'Medios de pago',
      'route': '',
      'icon': Icons.credit_card_outlined,
    },
    {
      'title': 'Cupones',
      'route': '',
      'icon': Icons.countertops_outlined,
    },
    {
      'title': 'Ayuda',
      'route': '',
      'icon': Icons.contact_support_outlined,
    },
    {
      'title': 'Cerrar sesion',
      'route': '',
      'icon': Icons.logout,
    },
  ];

  const _ListItemsUserProfileWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _listItems.length,
        itemBuilder: (context, i) => Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('${_listItems[i]['title']}'),
            leading: Icon(_listItems[i]['icon'] as IconData),
            onTap: () {},
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            trailing: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
