import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './consts/routes.dart';
import './consts/theme_data.dart';
import './providers/freelancer_provider.dart';
import './providers/index_homepage_provider.dart';
import './providers/profile_provider.dart';
import './screens/initial_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IndexHomePageProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => FreelancerProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    Provider.of<ProfileProvider>(context).loadData();
    Provider.of<FreelancerProvider>(context).loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waffly',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: InitialPage.route,
      routes: constRoutes,
    );
  }
}