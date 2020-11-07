import 'package:dio/dio.dart';
import 'package:ecommerce/src/MainWidgets/custom_new_dialog.dart';
import 'package:ecommerce/src/Models/post/deletNotificationModel.dart';
import 'package:ecommerce/src/Provider/get/notificationProvider.dart';
import 'package:ecommerce/src/Repository/appLocalization.dart';
import 'package:ecommerce/src/Repository/networkUtlis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletNotificationProvider with ChangeNotifier {
  NetworkUtil _utils = new NetworkUtil();
  DeleteNotificationModel deleteNotificationModel;
  CustomDialog dialog = CustomDialog();

  deletNot(String token, int id, int index, BuildContext context) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      "X-localization": localization.currentLanguage.toString(),
    };
    FormData formData = FormData.fromMap({});

    Response response = await _utils.post("delete_notification/$id",
        body: formData, headers: headers);
    if (response.statusCode == 200) {
      print("delete_notifications data sucsseful");
      deleteNotificationModel = DeleteNotificationModel.fromJson(response.data);
    } else {
      print("error delete_notifications data");
      deleteNotificationModel = DeleteNotificationModel.fromJson(response.data);
    }
    if (deleteNotificationModel.code == 200) {
      print("done");
      Provider.of<NotoficationProvider>(context, listen: false)
          .removeItem(index);

      // Fluttertoast.showToast(
      //     msg: localization.text("deleted"),
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 1,
      //     fontSize: 16.0);
      notifyListeners();

      return true;
    } else {
      print("done");
      print('error delete_notifications');
      // dialog.showErrorDialog(
      //   btnOnPress: () {},
      //   context: context,
      //   msg: localization.text("error"),
      //   ok: localization.text("ok"),
      // );
    }
  }
}
