import 'package:flutter/material.dart';
import 'package:locked_wallet/models/all_user_details_model.dart';
import 'package:locked_wallet/models/user_dashboard_details.dart';

import '../../services/user_api_service.dart';

class ViewProfileDetailsScreen extends StatefulWidget {
  const ViewProfileDetailsScreen({
    super.key,
  });

  @override
  State<ViewProfileDetailsScreen> createState() =>
      _ViewProfileDetailsScreenState();
}

class _ViewProfileDetailsScreenState extends State<ViewProfileDetailsScreen> {
  UserDashboardDetailModel? userDashboardDetails;
  AllUserDetails? user;
  @override
  void initState() {
    super.initState();
    getDashboardUserInfo();
    getAlluserDetails();
  }

  void getDashboardUserInfo() async {
    userDashboardDetails = await getUserDashboardDetails();
    setState(() {});
  }

  void getAlluserDetails() async {
    user = await getAllUserApiDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Your Profile"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      value: '${user?.user?.username}', labelText: "Name"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      value: "${user?.user?.email}", labelText: "Email"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      value: "${user?.user?.phone}", labelText: "Phone"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      value: "${user?.user?.accountId}",
                      labelText: "Account ID"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      value: "${userDashboardDetails?.type}",
                      labelText: "Account Type"),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // CustomTextField(value: "Name", labelText: "Name"),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // CustomTextField(value: "Name", labelText: "Name")
                ],
              ),
            ),
          ],
        ));
  }
}

///REQUIRED : LABEL TEXT, VALUE, CONTROLLER OPTIONAL
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.value,
    this.controller,
    this.labelText,
  });

  final String? value;
  final TextEditingController? controller;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText ?? '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class TwoTextFieldWidget extends StatelessWidget {
  const TwoTextFieldWidget(
      {super.key, required this.textfield1, required this.textField2});
  final Widget textfield1;
  final Widget textField2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.45, child: textfield1),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.45, child: textField2),
      ],
    );
  }
}
