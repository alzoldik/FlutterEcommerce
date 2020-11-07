import 'dart:async';
import 'package:ecommerce/src/MainScreens/Registeration/sign_in_screen.dart';
import 'package:ecommerce/src/MainWidgets/image_bg.dart';
import 'package:ecommerce/src/Repository/firebaseNotifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;

  const Splash({Key key, this.navigator}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Future<Timer> _loadData() async {
    return Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (c) => SignInScreen()));
    });
  }

  @override
  void initState() {
    _loadData();
    FirebaseNotifications().setUpFirebase(widget.navigator);
    super.initState();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ImageBG(),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icon/icon-00100.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .8),
              child: Shimmer.fromColors(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Ecommerce",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        " مرحبا بكم في تطبيق ",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  baseColor: Colors.black,
                  highlightColor: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
