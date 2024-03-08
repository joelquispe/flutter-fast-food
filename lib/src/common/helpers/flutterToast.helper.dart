import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastHelper(String msj, Color bgColor) {
  Fluttertoast.showToast(
    
    msg: msj,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: bgColor,
  );
}
