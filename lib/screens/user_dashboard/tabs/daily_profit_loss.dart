import 'package:flutter/material.dart';
import 'package:locked_wallet/constants.dart';
import 'package:locked_wallet/services/get_sum_profit_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../functions.dart';

class DailyProfitLoss extends StatefulWidget {
  const DailyProfitLoss({Key? key}) : super(key: key);

  @override
  State<DailyProfitLoss> createState() => _DailyProfitLossState();
}

class _DailyProfitLossState extends State<DailyProfitLoss> {
  String todayProfit = '0';
  String day3Profit = '0';
  String day2Profit = '0';
  String day1Profit = '0';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getTodayProfit();
    getDay3Profit();
    getDay2Profit();
    getDay1Profit();
  }

  void getTodayProfit() async {
    isLoading = true;
    String date = Functions.getDateinApiFormat(DateTime.now());
    int? prof = await getTotalProfitWithDateUser(date);
    todayProfit = prof.toString();
    isLoading = false;
    setState(() {});
    print("prof $prof");
  }

  void getDay3Profit() async {
    isLoading = true;
    String date = Functions.getDateinApiFormat(
        DateTime.now().subtract(Duration(days: 1)));
    int? prof = await getTotalProfitWithDateUser(date);
    day3Profit = prof.toString();
    isLoading = false;
    setState(() {});
    print("prof $prof");
  }

  void getDay2Profit() async {
    isLoading = true;
    String date = Functions.getDateinApiFormat(
        DateTime.now().subtract(Duration(days: 2)));
    int? prof = await getTotalProfitWithDateUser(date);
    print("prof $prof");
    day2Profit = prof.toString();
    isLoading = false;
    setState(() {});
  }

  void getDay1Profit() async {
    isLoading = true;
    String date = Functions.getDateinApiFormat(
        DateTime.now().subtract(Duration(days: 3)));
    int? prof = await getTotalProfitWithDateUser(date);
    day1Profit = prof.toString();
    isLoading = false;
    setState(() {});
    print("prof $prof");
  }

  var body;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: baseColor,
            ),
          )
        : Column(
            children: [
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
                            ProfitLoss(
                                '1',
                                double.parse(
                                  todayProfit.toString(),
                                )),
                            ProfitLoss(
                                '2',
                                double.parse(
                                  day3Profit.toString(),
                                )),
                            ProfitLoss(
                                '3',
                                double.parse(
                                  day2Profit.toString(),
                                )),
                            ProfitLoss(
                                '4',
                                double.parse(
                                  day1Profit.toString(),
                                )),
                          ],
                          xValueMapper: (ProfitLoss sales, _) => sales.day,
                          yValueMapper: (ProfitLoss sales, _) => sales.profit,
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
              ),
            ],
          );
  }

  // static getToken() async {
  //   SharedPreferences mainPref = await SharedPreferences.getInstance();
  //   var token = mainPref.getString("token");
  //   return token;
  // }
}

class ProfitLoss {
  ProfitLoss(this.day, this.profit);
  final String day;
  final double profit;
}
