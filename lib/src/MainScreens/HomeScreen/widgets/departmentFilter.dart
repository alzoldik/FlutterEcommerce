import 'package:ecommerce/src/MainWidgets/filtterCard.dart';
import 'package:ecommerce/src/Provider/depatmentsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DepartmentFilter extends StatefulWidget {
  @override
  _DepartmentFilterState createState() => _DepartmentFilterState();
}

class _DepartmentFilterState extends State<DepartmentFilter> {
  int slected = 0;
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 150), () {
      Provider.of<DepartMentProvider>(context, listen: false).getDepartements();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 3),
      child: Container(
        height: 80,
        child: AnimationLimiter(
          child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: Provider.of<DepartMentProvider>(context, listen: true)
                  .departments
                  .length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 400),
                  child: SlideAnimation(
                    duration: Duration(milliseconds: 400),
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Filtter(
                          image: Provider.of<DepartMentProvider>(context,
                                  listen: false)
                              .departments[index]
                              .image,
                          title: Provider.of<DepartMentProvider>(context,
                                  listen: false)
                              .departments[index]
                              .title,
                          onTap: () {
                            setState(() {
                              Provider.of<DepartMentProvider>(context,
                                      listen: false)
                                  .departments[index]
                                  .selected = true;
                              for (int i = 0;
                                  i <
                                      Provider.of<DepartMentProvider>(context,
                                              listen: false)
                                          .departments
                                          .length;
                                  i++) {
                                setState(() {
                                  if (i == index) {
                                  } else {
                                    Provider.of<DepartMentProvider>(context,
                                            listen: false)
                                        .departments[i]
                                        .selected = false;
                                  }
                                });
                              }
                            });
                          },
                          backgroundColor: Provider.of<DepartMentProvider>(
                                      context,
                                      listen: true)
                                  .departments[index]
                                  .selected
                              ? Theme.of(context).accentColor
                              : null,
                          titleColor: Provider.of<DepartMentProvider>(context,
                                      listen: true)
                                  .departments[index]
                                  .selected
                              ? Theme.of(context).accentColor
                              : null,
                          iconColor: Provider.of<DepartMentProvider>(context,
                                      listen: true)
                                  .departments[index]
                                  .selected
                              ? Colors.white
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
