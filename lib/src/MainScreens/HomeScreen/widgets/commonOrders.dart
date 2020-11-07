import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CommonOrders extends StatefulWidget {
  @override
  _CommonOrdersState createState() => _CommonOrdersState();
}

class _CommonOrdersState extends State<CommonOrders> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(right: 10, left: 25),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: Duration(milliseconds: 400),
            child: SlideAnimation(
              duration: Duration(milliseconds: 400),
              verticalOffset: 50.0,
              child: FadeInAnimation(
                  child: Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/image.jpg"),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("اسم المطعم",
                                style: Theme.of(context).textTheme.headline2),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.shop,
                                          size: 15,
                                          color: Colors.grey[300],
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "مطعم",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 15,
                                          color: Colors.grey[300],
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "السعودية وامام مول باندا",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "4.0",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ImageIcon(
                                          AssetImage('assets/images/dil.png'),
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'التوصيل : 30 دقيقة',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ),
          );
        });
  }
}
