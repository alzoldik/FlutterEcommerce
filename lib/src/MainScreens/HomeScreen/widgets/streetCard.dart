import 'package:flutter/material.dart';

class StreetCard extends StatefulWidget {
  @override
  _StreetCardState createState() => _StreetCardState();
}

class _StreetCardState extends State<StreetCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 180,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
          right: 15,
          top: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'شارع محمد علي,المملكة السعودية',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.pin_drop_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
