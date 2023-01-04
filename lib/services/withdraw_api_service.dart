import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:locked_wallet/models/withdraw_freq_setting_model.dart';
import 'package:locked_wallet/models/withdraw_method_model.dart';
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

Future<bool> saveWithdrawFrequencySetting(
    {String? payoutFreq,
    String? value1,
    String? value2,
    String? userId}) async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.post(
      '$base_url/api/withdraw/settings',
      data: {
        "userId": userId,
        "payoutfreq": "${payoutFreq}",
        "withdraw": "$value1",
        "compound": "$value2"
      },
      options: Options(
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.data);
      Fluttertoast.showToast(msg: '${response.data['msg']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Sorry, Error');
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}

Future<WithdrawFreqSetting?> getWithdrawFreqSettings() async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/withdraw/getsettings',
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = response.data['data'];
      WithdrawFreqSetting setting = WithdrawFreqSetting.fromJson(data);

      return setting;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<WithdrawMethod>?> getAllWithdrawMethods() async {
  print('called');
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/withdraw/methods',
      options: Options(
        headers: {'Authorization': token},
      ),
    );

    if (response.statusCode == 200) {
      List data = response.data['data'];
      List<WithdrawMethod> realData = [];
      data.forEach((element) {
        WithdrawMethod withdraw = WithdrawMethod.fromJson(element);
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

Future<bool> saveWithdrawAddress({
  String? method,
  String? bank,
  String? crypto,
}) async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.post(
      '$base_url/api/withdraw/newmethod',
      data: {
        "method": "$method",
        "bankacc": bank ?? '',
        "cryptoid": crypto ?? '',
      },
      options: Options(
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      print(response.data);
      Fluttertoast.showToast(msg: '${response.data['msg']}');
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Sorry, Error');
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
