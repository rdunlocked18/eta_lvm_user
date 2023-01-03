// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:locked_wallet/models/user_dashboard_details.dart';
import 'package:locked_wallet/models/user_single_order_model.dart';
import 'package:locked_wallet/screens/admin_dashboard/admin_all_users_model/admin_all_users_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common_widget/reusable_tableRow.dart';
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
  List<SingleOrder> userOrders = [];

  @override
  void initState() {
    super.initState();
    getDashboardUserInfo();
    getUserOrders();
  }

  void getUserOrders() async {
    userOrders = await getAllUserOrders() ?? [];
    List<double> _as = [];
    userOrders.forEach((element) {
      _as.add(double.parse(element.takeProfit ?? '0'));
    });
    print(_as);
    double sum = _as.fold(0, (p, c) => p + c);
    print(sum);
    totalNetPath = sum.toString();
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
                            "Net Profit",
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
                            "Trades",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${userOrders.length}',
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
            firstList: ['Type', 'Trades', 'Take Profit', 'Time'],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: userOrders.length,
            itemBuilder: (contex, index) {
              return GestureDetector(
                onTap: () {
                  print(userOrders[index].orderId.toString());
                },
                child: Column(
                  children: [
                    CustomTable(
                      firstList: [
                        userOrders[index].type.toString(),
                        userOrders[index].symbol.toString(),
                        userOrders[index].takeProfit.toString(),
                        userOrders[index].updatedAt == null
                            ? 'Invalid Time'
                            : getValidZOrderTime(
                                userOrders[index].updatedAt.toString())
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
