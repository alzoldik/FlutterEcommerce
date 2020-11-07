import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  String text = "";
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              controller.clear();
                              text = "";
                            });
                          },
                          child: Icon(
                              text.length > 0 ? Icons.clear : Icons.search)),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: (v) {},
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          hintText: "ابحث عن كل ما تحتاجه",
                        ),
                        onChanged: (v) {
                          setState(() {
                            text = v;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: InkWell(onTap: () {}, child: Icon(Icons.menu)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
