import 'package:flutter/material.dart';

class DepartMentProvider with ChangeNotifier {
  List<Model> _departments = [];

  List<Model> get departments {
    return [..._departments];
  }

  getDepartements() {
    final List<Model> loaded = [];

    print("get departments sucsseful");
    loaded.add(Model(
      image: "assets/images/07.png",
      selected: false,
      title: "الكل",
    ));
    loaded.add(Model(
      image: "assets/images/06.png",
      selected: false,
      title: "مكتبات",
    ));
    loaded.add(Model(
      image: "assets/images/05.png",
      selected: false,
      title: "صيدلية",
    ));
    loaded.add(Model(
      image: "assets/images/04.png",
      selected: false,
      title: "سوبرماركت",
    ));
    loaded.add(Model(
      image: "assets/images/03.png",
      selected: false,
      title: "خضراوات",
    ));
    loaded.add(Model(
      image: "assets/images/02.png",
      selected: false,
      title: "الكافيهات",
    ));
    loaded.add(Model(
      image: "assets/images/01.png",
      selected: false,
      title: "المطاعم",
    ));
    _departments = loaded.toList();
    notifyListeners();
  }
}

class Model {
  String image;
  String title;
  bool selected;

  Model({@required this.image, @required this.title, @required this.selected});
}
