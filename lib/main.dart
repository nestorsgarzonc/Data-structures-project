import 'package:ed_project/providers/index_homepage_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/authentication/login_page.dart';
import './screens/authentication/register_page.dart';
import './screens/home/main_page.dart';
import 'screens/initial_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => IndexHomePage(),
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
                title: 'Material App',
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light().copyWith(
                  primaryColor: const Color(0xFFE94832),
                  buttonColor: const Color(0xFFE94832),
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: Color(0xFFE94832),
                    elevation: 5,
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      elevation: 10,
                      selectedIconTheme: IconThemeData(size: 30)),
                ),
                initialRoute: InitialPage.route,
                routes: {
                  InitialPage.route: (ctx) => InitialPage(),
                  RegisterPage.route: (ctx) => RegisterPage(),
                  LoginPage.route: (ctx) => LoginPage(),
                  MainPage.route: (ctx) => MainPage(),
                },
              )
            : const CircularProgressIndicator();
      },
    );
  }
}
