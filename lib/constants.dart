import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String base_url = "https://api.lockedvaultenterprises.com";
var dio = Dio();
const Color baseColor = Color(0xFF0C331F);

String getvalidDate(String dd) {
  var f = DateFormat('dd - MMM - yyyy');
  var date = f.format(
    DateTime.parse(dd),
  );

  return date;
}

String getValidZOrderTime(String date) {
  DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
