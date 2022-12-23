import 'package:flutter/material.dart';
import 'package:locked_wallet/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences mainPref = await SharedPreferences.getInstance();
  var token = mainPref.getString("token");
  print("TOKEN:$token");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    ),
  );
}
