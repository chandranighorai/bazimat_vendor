import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showCustomToast(message, [Color mColor]) {
  mColor = Color(0x99000000);
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[100],
      textColor: Colors.black,
      fontSize: 16.0);
}
