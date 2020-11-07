import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Helpers/map_helper.dart';
import 'Helpers/sharedPref_helper.dart';
import 'MainScreens/Intro/splash_screen.dart';
import 'Provider/auth/loginProvider.dart';
import 'Provider/auth/registerMobileProvider.dart';
import 'Provider/depatmentsProvider.dart';
import 'Provider/termsProvider.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;

  const MyApp({Key key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DepartMentProvider()),
        ChangeNotifierProvider(create: (_) => MapHelper()),
        ChangeNotifierProvider(create: (_) => SharedPref()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterMobileProvider()),
        ChangeNotifierProvider(create: (_) => TermsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: ThemeData(
          fontFamily: "cairo",


          primaryColor: Color.fromRGBO(255, 214, 0, 1),
          accentColor: Color.fromRGBO(255, 214, 0, 1),
          // Color.fromRGBO(253, 238, 147, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(fontSize: 10, color: Colors.grey),
            bodyText2: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
        home: Splash(
          navigator: navigator,
        ),
      ),
    );
  }
}
