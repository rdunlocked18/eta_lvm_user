// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locked_wallet/models/user_dashboard_details.dart';
import 'package:locked_wallet/models/user_single_order_model.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_all_users_model/admin_all_users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widget/reusable_tableRow.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';
import '../../../services/order_api_service.dart';
import '../../../services/user_api_service.dart';

class DashBoardWithDrawContract extends StatefulWidget {
  const DashBoardWithDrawContract({Key? key}) : super(key: key);

  @override
  State<DashBoardWithDrawContract> createState() =>
      _DashBoardWithDrawContractState();
}

class _DashBoardWithDrawContractState extends State<DashBoardWithDrawContract> {
  //String token = getToken();
  String? totalBalance = '--';
  String? totalEquity = '--';
  String? totalNetPath = '--';
  String? totalProfit = '--';

  var message = [];
  var sync = [];
  List<UserModel> list = [];
  UserModel? select;
  List<SingleOrder>? userOrders = [];

  @override
  void initState() {
    super.initState();
    getDashboardUserInfo();
    getUserOrders();
  }

  void getUserOrders() async {
    userOrders = await getAllUserOrders();
    print(userOrders);
    setState(() {});
  }

  void getDashboardUserInfo() async {
    UserDashboardDetailModel? userDashboardDetails =
        await getUserDashboardDetails();

    if (userDashboardDetails != null) {
      totalBalance = userDashboardDetails.balance;
      totalEquity = userDashboardDetails.equity;
    }
    setState(() {});
  }

  GetAllUsers() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    var headers = {'Authorization': token};
    var request =
        http.Request('GET', Uri.parse('$base_url/api/admin/getallusers'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      message = body['data'];
      for (int i = 0; i < message.length; i++) {
        UserModel getList = UserModel.fromJson(message[i]);
        list.add(getList);
        setState(() {});
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  syncDash() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    var headers = {'Authorization': token};
    var request =
        http.Request('GET', Uri.parse('$base_url/api/user/getdashboard'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      sync = body['data'];
      setState(() {});
      // print('Sync is =$sync');
    } else {
      print(response.reasonPhrase);
    }
  }

  var data = [];
  getData() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    var headers = {
      'Authorization': token,
      'Cookie':
          'connect.sid=s%3AmBcOuoyugB54QXZqpWGQQbK88si9NELb.HBHNqX4GA599IDUwztdjItc%2B6yrnEzELzfKGnwRfu8Q'
    };
    var request =
        http.Request('GET', Uri.parse('$base_url/api/admin/getallusers'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      data = body['data'];
      setState(() {});
      print(data);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //graph
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .5,
            child: SfCartesianChart(
                palette: [Color(0xFF0C331F)],
                primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Days')),
                primaryYAxis:
                    NumericAxis(title: AxisTitle(text: 'Profit / Loss')),
                series: <ChartSeries>[
                  ColumnSeries<ProfitLoss, String>(
                      dataSource: <ProfitLoss>[
                        ProfitLoss('1', 89),
                        ProfitLoss('2', 280),
                        ProfitLoss('3', 54),
                        ProfitLoss('4', 320),
                        ProfitLoss('5', 400),
                        ProfitLoss('6', -190),
                        ProfitLoss('7', 200),
                        ProfitLoss('8', -111),
                        ProfitLoss('9', 320),
                        ProfitLoss('10', 240),
                        ProfitLoss('11', 280),
                        ProfitLoss('12', 900),
                        ProfitLoss('13', -220),
                        ProfitLoss('14', 400),
                        ProfitLoss('15', -190),
                        ProfitLoss('16', 600),
                        ProfitLoss('17', -111),
                        ProfitLoss('18', 320),
                        ProfitLoss('19', -240),
                        ProfitLoss('20', 440),
                      ],
                      xValueMapper: (ProfitLoss sales, _) => sales.day,
                      yValueMapper: (ProfitLoss sales, _) => sales.profit,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),

          //Buttons

          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$totalBalance',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Equity",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$totalEquity',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Net Path",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$totalNetPath',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            "Profit",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$totalProfit',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          CustomTable(
            firstList: ['Platform', 'Trades', 'Take Profit', 'Time'],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: userOrders?.length,
            itemBuilder: (contex, index) {
              return GestureDetector(
                onTap: () {
                  print(userOrders![index].orderId.toString());
                },
                child: Column(
                  children: [
                    CustomTable(
                      firstList: [
                        userOrders![index].platform.toString(),
                        userOrders![index].symbol.toString(),
                        userOrders![index].takeProfit.toString(),
                        getValidZOrderTime(userOrders![index].time.toString())
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Table CustomTable({
    // required List<String> heading,
    required List<String> firstList,
    // required List<String> secondList,
    // required List<String> thirdList,
    // required List<String> fourthList,
  }) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.25),
        1: FractionColumnWidth(0.25),
        2: FractionColumnWidth(0.25),
        3: FractionColumnWidth(0.25),
      },
      children: [
        //ReusableTableRow(heading),
        ReusableTableRow(firstList),
        // ReusableTableRow(secondList),
        // ReusableTableRow(thirdList),
        // ReusableTableRow(fourthList),
      ],
    );
  }
}

class ProfitLoss {
  ProfitLoss(this.day, this.profit);

  final String day;
  final double profit;
}
