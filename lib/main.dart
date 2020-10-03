import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './consts/routes.dart';
import './consts/theme_data.dart';
import './providers/index_homepage_provider.dart';
import './screens/initial_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => IndexHomePageProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? MaterialApp(
                title: 'Waffly',
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                initialRoute: InitialPage.route,
                routes: constRoutes,
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
