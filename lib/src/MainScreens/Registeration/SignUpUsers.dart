import 'package:ecommerce/src/Helpers/map_helper.dart';
import 'package:ecommerce/src/MainWidgets/customBtn.dart';
import 'package:ecommerce/src/MainWidgets/custom_alert.dart';
import 'package:ecommerce/src/MainWidgets/image_bg.dart';
import 'package:ecommerce/src/MainWidgets/register_secure_text_field.dart';
import 'package:ecommerce/src/MainWidgets/register_text_field.dart';
import 'package:ecommerce/src/MainWidgets/terms_dialog.dart';
import 'package:ecommerce/src/Provider/termsProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainPage.dart';
import 'widget/appIcon.dart';
import 'widget/lockIcon.dart';

class SignUpUsers extends StatefulWidget {
  @override
  _SignUpUsersState createState() => _SignUpUsersState();
}

class _SignUpUsersState extends State<SignUpUsers> {
  bool _accept = false;
  FirebaseMessaging _fcm = FirebaseMessaging();
  String _deviceToken;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Provider.of<MapHelper>(context, listen: false).getLocation();
    Provider.of<TermsProvider>(context, listen: false).getTerms();
    _fcm.getToken().then((response) {
      setState(() {
        _deviceToken = response;
      });
      print('The device Token is :' + _deviceToken);
    });
    super.initState();
  }

  bool city = false;
  final _form = GlobalKey<FormState>();
  bool autoError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _form,
        autovalidateMode:
            autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Stack(
          children: <Widget>[
            ImageBG(),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                AppIcon(),
                LockIcon(),
                SizedBox(height: 20),
                RegisterTextField(
                  icon: Icons.person,
                  onChange: (v) {},
                  label: 'الاسم',
                  type: TextInputType.text,
                ),
                SizedBox(height: 20),
                RegisterTextField(
                  icon: Icons.mail,
                  onChange: (v) {},
                  label: 'الايميل',
                  type: TextInputType.text,
                ),
                SizedBox(height: 20),
                RegisterSecureTextField(
                  onChange: (v) {},
                  label: "كلمة المرور",
                  icon: Icons.lock,
                ),
                SizedBox(height: 20),
                RegisterSecureTextField(
                  onChange: (v) {},
                  icon: Icons.lock,
                  label: 'تأكيد كلمة المرور',
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  value: _accept,
                  onChanged: (value) {
                    setState(() {
                      _accept = !_accept;
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  dense: true,
                  title: InkWell(
                    onTap: () => TermsDialog().show(context: context),
                    child: Text(
                      'اوافق على الشروط والأحكام',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomBtn(
                  txtColor: Colors.white,
                  heigh: 45,
                  onTap: () {
                    setState(() {
                      autoError = true;
                    });
                    final isValid = _form.currentState.validate();
                    if (!isValid) {
                      return;
                    }
                    _form.currentState.save();

                    if (_accept == false) {
                      CustomAlert().toast(
                          context: context,
                          title: 'يجب الموافقة على الشروط والأحكام');
                    } else {
                      _form.currentState.save();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => MainPage()));
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  text: 'انشاء حساب',
                ),
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
