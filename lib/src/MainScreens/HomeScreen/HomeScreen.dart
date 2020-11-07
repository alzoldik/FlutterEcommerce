import 'package:ecommerce/src/MainWidgets/customSearchBar.dart';
import 'package:flutter/material.dart';
import 'widgets/commonOrders.dart';
import 'widgets/departmentFilter.dart';
import 'widgets/streetCard.dart';
import 'widgets/topOrders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          StreetCard(),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.12,
                right: 10,
                left: 10),
            child: CustomSearchBar(),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.25,
            ),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DepartmentFilter(),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Text(
                            "الطلبات الاكثر طلبا",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        TopOrders(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 5),
                          child: Text(
                            "المطاعم الاكثر شيوعا",
                            // style: Theme.of(context).textTheme.headline2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        CommonOrders()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
