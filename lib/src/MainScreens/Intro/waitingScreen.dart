import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WaitingAccepting extends StatefulWidget {
  @override
  _WaitingAcceptingState createState() => _WaitingAcceptingState();
}

class _WaitingAcceptingState extends State<WaitingAccepting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text("تم ارسال البيانات وفي انتظار الرد عليها من الادارة"),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () async {},
              child: Row(
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text("تسجيل خروج"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
