import 'package:ecommerce/src/MainWidgets/customBtn.dart';
import 'package:ecommerce/src/MainWidgets/image_bg.dart';
import 'package:ecommerce/src/MainWidgets/register_secure_text_field.dart';
import 'package:flutter/material.dart';
import 'widget/appIcon.dart';
import 'widget/lockIcon.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
            Center(
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: <Widget>[
                    AppIcon(),
                    LockIcon(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'تغير كلمة المرور',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'cairo'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterSecureTextField(
                      icon: Icons.lock,
                      label: "كلمة المرور",
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterSecureTextField(
                      icon: Icons.lock,
                      label: "كلمة المرور",
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 20,
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
                      },
                      color: Theme.of(context).primaryColor,
                      text: 'تأكيد',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
