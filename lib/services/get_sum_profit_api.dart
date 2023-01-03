import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

Future<int?> getTotalProfitWithDateUser(String? dates) async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.post(
      '$base_url/api/user/cumulated/profit',
      data: {'start': dates, 'end': dates},
      options: Options(
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return response.data['totalProfit'];
    } else {
      Fluttertoast.showToast(msg: 'Sorry, Error');
      return 0;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
