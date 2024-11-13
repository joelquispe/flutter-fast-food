import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastUtil(String msj, {Color bgColor = secondaryColor}) {
  Fluttertoast.showToast(
    msg: msj,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: bgColor,
  );
}