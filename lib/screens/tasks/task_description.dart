import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../payment/payment.dart';
import '../../providers/profile_provider.dart';
import '../../widgets/back_button_appbar_widget.dart';

class TaskPage extends StatelessWidget {
  static const String route = 'taskPage';
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final service = provider.getSelectedService;
    final freelancer = provider.getSelectedFreelancer;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.49,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(service.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              top: 60,
              left: 30,
              child: BackButtonAppBarWidget(),
            ),
            Positioned(
              top: 60,
              right: 30,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200),
                ),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.55,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(30),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.5,
                              child: Text(
                                service.serviceName,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                Text(' ${freelancer.location}'),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(freelancer.avatarUrl),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Descripcion',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''')
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 75,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${service.price}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 15,
                      ),
                      onPressed: () => Navigator.of(context).pushNamed(PaymentPage.route),
                      color: Theme.of(context).primaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Comprar ahora',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
