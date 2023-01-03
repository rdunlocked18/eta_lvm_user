import 'package:dio/dio.dart';
import 'package:locked_wallet/models/withdraw_single.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

Future<List<WithdrawSingle>?> getAllUserWithdraws() async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/withdraw/all',
      options: Options(
        headers: {'Authorization': token},
      ),
    );

    if (response.statusCode == 200) {
      List data = response.data['data'];
      List<WithdrawSingle> realData = [];
      data.forEach((element) {
        WithdrawSingle withdraw = WithdrawSingle.fromJson(element);
        realData.add(withdraw);
      });

      print(realData);
      return realData;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
    return null;
  }
}
