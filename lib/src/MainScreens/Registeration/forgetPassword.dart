import 'package:ecommerce/src/MainScreens/Registeration/reset_password_screen.dart';
import 'package:ecommerce/src/MainWidgets/customBtn.dart';
import 'package:ecommerce/src/MainWidgets/image_bg.dart';
import 'package:ecommerce/src/MainWidgets/register_text_field.dart';
import 'package:flutter/material.dart';
import 'widget/appIcon.dart';
import 'widget/lockIcon.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  void initState() {
    super.initState();
  }

  final _form = GlobalKey<FormState>();
  bool autoError = false;
  @override
  Widget build(BuildContext context) {
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
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        AppIcon(),
                        LockIcon(),
                        Center(
                            child: Text(
                          "فضلا ادخل رقم الجوال",
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text(
                          "لاستعادة كلمة المرور",
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        )),
                        SizedBox(
                          height: 50,
                        ),
                        RegisterTextField(
                          hint: 'رقم الجوال',
                          icon: Icons.phone,
                          onChange: (v) {},
                        ),
                        SizedBox(
                          height: 10,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ResetPasswordScreen()));
                          },
                          color: Theme.of(context).primaryColor,
                          text: 'ارسال كود التفعيل',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
