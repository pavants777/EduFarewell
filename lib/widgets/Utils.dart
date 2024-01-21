import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:http/http.dart' as http;

// void showSnackbar(BuildContext context, String message) {
//   final snackBar = SnackBar(
//     content: Text(message),
//     duration: Duration(seconds: 3),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

SnackbarController GetXSnackbar(String message) {
  return Get.snackbar("Error", message,
      duration: Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      isDismissible: true);
}

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      print("${jsonDecode(response.body)['msg'] ?? 'Unknown error'}");
      GetXSnackbar(jsonDecode(response.body)['msg']);
      break;
    case 500:
      print("${jsonDecode(response.body)['error'] ?? 'Unknown error'}");
      GetXSnackbar(jsonDecode(response.body)['error']);
      break;
    default:
      GetXSnackbar(response.body);
  }
}
