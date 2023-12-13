import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void toastMessage(String text){
  Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Future<String> dateFormat(String date) async{
  DateTime originalDate = DateTime.parse(date);
  String formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);
  return formattedDate;
}