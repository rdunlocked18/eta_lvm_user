import 'package:dio/dio.dart';
import 'package:locked_wallet/models/all_user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/user_dashboard_details.dart';

Future<UserDashboardDetailModel?> getUserDashboardDetails() async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/user/getdashboard',
      options: Options(
        headers: {'Authorization': token},
      ),
    );

    if (response.statusCode == 200) {
      UserDashboardDetailModel userDetails =
          UserDashboardDetailModel.fromJson(response.data['data'][0]);

      print(userDetails.balance);
      return userDetails;
    } else {
      return UserDashboardDetailModel();
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<AllUserDetails?> getAllUserApiDetails() async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/auth/user',
      options: Options(
        headers: {'Authorization': token},
      ),
    );

    if (response.statusCode == 200) {
      AllUserDetails userDetails = AllUserDetails.fromJson(response.data);

      print(userDetails.user?.username);
      return userDetails;
    } else {
      return AllUserDetails();
    }
  } catch (e) {
    print(e);
    return null;
  }
}
