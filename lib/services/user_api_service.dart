import 'package:dio/dio.dart';
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
