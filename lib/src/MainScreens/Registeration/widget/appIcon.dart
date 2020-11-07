import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0,bottom: 20),
      child: Center(
          child: Image.asset('assets/icon/icon-00100.png',
              height: 120, fit: BoxFit.cover)),
    );
  }
}
