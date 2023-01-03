// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_all_users_model/admin_all_users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widget/reusable_tableRow.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class DashBoardWithDrawContract extends StatefulWidget {
  const DashBoardWithDrawContract({Key? key}) : super(key: key);

  @override
  State<DashBoardWithDrawContract> createState() =>
      _DashBoardWithDrawContractState();
}

class _DashBoardWithDrawContractState extends State<DashBoardWithDrawContract> {
  //String token = getToken();
  String totalBalance = 1000.toString();
  String totalEquity = 1000.toString();
  String totalNetPath = 1000.toString();
  String totalProfit = 1000.toString();

  var message = [];
  var sync = [];
  List<UserModel> list = [];
  UserModel? select;
  void initState() {
    super.initState();
    GetAllUsers();
    getData();
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
            firstList: ['Trades', 'PiPs', 'Time'],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (contex, index) {
                // var date=DateTime(int.parse(list[index].createDate.toString()));
                // print(date);

                // var f = DateFormat('E, d MMM yyyy HH:mm:ss');
                // var date = f.format(DateFormat(TimeOfDay.fromDateTime()).toUtc()) + " GMT";
                //  print(date);
                return GestureDetector(
                  onTap: () {
                    print(list[index].createDate.toString());
                  },
                  child: Column(
                    children: [
                      //heading: [],
                      //isHeader: true),
                      CustomTable(
                        // heading: ['Trades', 'P/Ps', 'Time'],
                        firstList: [
                          data[index]['username'].toString(),
                          data[index]['totalProfit'].toString(),
                          // data[index]['totalProfit'].toString(),
                          data[index]['createdAt'].toString()
                        ],
                        // secondList: ['Jpy/USD', '40', '74'],
                        // thirdList: ['BTC/USD', '71', '17'],
                        // fourthList: ['XUA/USD', '67', '11']
                      ),
                    ],
                  ),
                );
                //   Column(children: [
                //   Row(
                //     children: [
                //      Column(children: [
                //        Text(list[index].username ?? "null"),
                //        SizedBox(height: 2,),
                //        Divider(color: Colors.grey,)
                //      ],)
                //     ],
                //   ),
                // ],);
              }),

          // CustomTable(
          //     heading: ['Trades', 'P/Ps', 'Time'],
          //     firstList: [list[1].username ?? "null", '20', '55'],
          //     secondList: ['Jpy/USD', '40', '74'],
          //     thirdList: ['BTC/USD', '71', '17'],
          //     fourthList: ['XUA/USD', '67', '11'])
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
        0: FractionColumnWidth(0.5),
        1: FractionColumnWidth(0.15),
        2: FractionColumnWidth(0.35),
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
