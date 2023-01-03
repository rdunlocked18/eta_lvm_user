import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../functions.dart';
import 'package:http/http.dart' as http;

Future<int?>? get_user_cumulated_profit(DateTime startDate, int endDate) async {
  var body;
  print('$endDate');
  SharedPreferences mainPref = await SharedPreferences.getInstance();
  String token = mainPref.getString("token") ?? "";

  var headers = {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

  var request = http.Request(
    'POST',
    Uri.parse(
      '$base_url/api/user/cumulated/profit',
    ),
  );

  request.headers.addAll(headers);

  print("${Functions.getDateinApiFormat(startDate)}");
  print(
      "${Functions.getDateinApiFormat(Functions.dateAgo(startDate, endDate))}");
  request.body = json.encode({
    "start": "${Functions.getDateinApiFormat(startDate)}",
    "end":
        "${Functions.getDateinApiFormat(Functions.dateAgo(startDate, endDate))}"
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    //print(await response.stream.bytesToString());
    var res = await response.stream.bytesToString();
    body = jsonDecode(res);
    return body['totalProfit'] ?? null;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
