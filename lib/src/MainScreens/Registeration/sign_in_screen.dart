import 'package:ecommerce/src/Helpers/map_helper.dart';
import 'package:ecommerce/src/MainScreens/mainPage.dart';
import 'package:ecommerce/src/MainWidgets/customBtn.dart';
import 'package:ecommerce/src/MainWidgets/image_bg.dart';
import 'package:ecommerce/src/MainWidgets/register_secure_text_field.dart';
import 'package:ecommerce/src/MainWidgets/register_text_field.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/auth/loginProvider.dart';
import 'forgetPassword.dart';
import 'register_mobile_screen.dart';
import 'widget/appIcon.dart';
import 'widget/lockIcon.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MapHelper>(context, listen: false).getLocation();
    _fcm.getToken().then((response) {
      setState(() {
        _deviceToken = response;
      });
      print('The device Token is :' + _deviceToken);
    });
  }

  FirebaseMessaging _fcm = FirebaseMessaging();
  String _deviceToken;
  final _form = GlobalKey<FormState>();
  bool autoError = false;

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _form,
          autovalidateMode:
              autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: Stack(
            children: <Widget>[
              ImageBG(),
              ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppIcon(),
                          LockIcon(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RegisterTextField(
                            hint: 'رقم الجوال',
                            icon: Icons.phone,
                            onChange: (v) {
                              loginProvider.phone = v;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RegisterSecureTextField(
                            icon: Icons.lock,
                            label: "كلمة المرور",
                            onChange: (v) {
                              loginProvider.password = v;
                            },
                          ),
                          Center(
                            child: FlatButton(
                              child: Text('نسيت كلمة المرور ',
                                  style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ForgetPassword()));
                              },
                            ),
                          ),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => MainPage()));
                            },
                            color: Theme.of(context).primaryColor,
                            text: 'دخول',
                          ),
                          CustomBtn(
                            txtColor: Colors.white,
                            heigh: 45,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RegisterMobileScreen()));
                            },
                            color: Colors.grey[600],
                            text: 'تسجيل جديد',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
