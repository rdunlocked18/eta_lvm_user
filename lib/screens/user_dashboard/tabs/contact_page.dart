import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:locked_wallet/models/user_dashboard_details.dart';
import 'package:locked_wallet/services/user_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController messageController = TextEditingController();
  List<String> _items = [
    'Withdraw',
    'Account Error',
    'Meta Trader',
    'Application',
    'Orders',
    'Others'
  ];
  String? _initialValue;
  UserDashboardDetailModel? userDetails;
  @override
  void initState() {
    super.initState();
  }

  void getUserDetails() async {
    userDetails = await getUserDashboardDetails();
    if (userDetails != null) {
      postContactQuery(userDetails?.userId);
    } else {
      print("Unable to get user");
    }
  }

  void postContactQuery(int? id) async {
    if (messageController.text != '') {
      try {
        SharedPreferences mainPref = await SharedPreferences.getInstance();
        String token = mainPref.getString("token") ?? '';
        Response response = await dio.post(
          '$base_url/api/contact/add',
          data: {
            "userId": "${id}",
            "issue": _initialValue,
            "message": "${messageController.text}",
          },
          options: Options(
            headers: {
              'Authorization': token,
              'Content-Type': 'application/json',
            },
          ),
        );

        if (response.statusCode == 200) {
          Fluttertoast.showToast(
              msg: 'Thankyou, We will get back to you shortly');
        } else {
          Fluttertoast.showToast(msg: 'Sorry, Error');
        }
      } catch (e) {
        print(e);
      }
    } else {
      Fluttertoast.showToast(msg: 'Please Write your Query First');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Issue",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFF0C331F), width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _initialValue,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "General",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _items
                  .map(
                    (e) => DropdownMenuItem<String>(
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (v) {
                setState(() {
                  _initialValue = v!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Message",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: messageController,
          maxLines: 6,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0C331F)),
            onPressed: () {
              getUserDetails();
            },
            child: Text("Save"),
          ),
        ),
      ],
    );
  }
}
