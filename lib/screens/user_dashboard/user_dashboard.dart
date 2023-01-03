import 'package:flutter/material.dart';
import 'package:locked_wallet/models/user_single_order_model.dart';
import 'package:locked_wallet/screens/user_dashboard/graphic_view_screen.dart';
import 'package:locked_wallet/screens/user_dashboard/view_profile_details_screen.dart';
import 'package:locked_wallet/services/order_api_service.dart';

import '../../models/user_dashboard_details.dart';
import '../../services/user_api_service.dart';
import 'tabs/contact_page.dart';
import 'tabs/dashbard_widraw_contract.dart';
import 'tabs/withdraw_frequency_settings.dart';
import 'tabs/withdraw_address.dart';
import 'tabs/withdraw_history.dart';

class UserHomeDashboard extends StatefulWidget {
  const UserHomeDashboard({Key? key}) : super(key: key);

  @override
  State<UserHomeDashboard> createState() => _UserHomeDashboardState();
}

class _UserHomeDashboardState extends State<UserHomeDashboard> {
  var week1 = [];
  var week2 = [];
  var week3 = [];
  var week4 = [];
  List<SingleOrder>? userOrders = [];
  String? currency;

  @override
  void initState() {
    super.initState();
    getDashboardUserInfo();
  }

  void getDashboardUserInfo() async {
    UserDashboardDetailModel? userDashboardDetails =
        await getUserDashboardDetails();

    if (userDashboardDetails != null) {
      currency = userDashboardDetails.currency;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Color(0xFF0C331F),
              foregroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewProfileDetailsScreen(),
                    ),
                  );
                },
                tooltip: 'View Profile',
                icon: Icon(
                  Icons.person,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8),
                color: Color(0xFF0C331F),
                child: Text(
                  currency ?? '--',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GraphicViewScreen(),
                  ));
                },
                tooltip: 'Show Graphs',
                icon: Icon(
                  Icons.auto_graph_rounded,
                ),
              ),
            ),
          )
        ],
        title: Text("Locked Vault Enterprises"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF0C331F)),
                tabs: [
                  Tab(
                    text: 'Dashboard',
                  ),
                  Tab(
                    text: 'Contact',
                  ),
                  Tab(
                    text: 'Withdraw History',
                  ),
                  Tab(
                    text: "Frequency Settings",
                  ),
                  Tab(
                    text: "Withdraw Address",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DashBoardWithDrawContract(),
                    ContactPage(),
                    WithdrawHistory(),
                    WithdrawFrequencyTab(),
                    WithdrawAddress(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
