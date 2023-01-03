import 'package:flutter/material.dart';
import 'package:locked_wallet/services/get_sum_profit_api.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DailyProfitLoss extends StatefulWidget {
  const DailyProfitLoss({Key? key}) : super(key: key);

  @override
  State<DailyProfitLoss> createState() => _DailyProfitLossState();
}

class _DailyProfitLossState extends State<DailyProfitLoss> {
  var body;

  Future<void> getData() async {
    List<int>? totalProf;
    for (int i = 0; i <= 3; ++i) {
      int? prof = await get_user_cumulated_profit(DateTime.now(), i);
      print("prof $prof");
      totalProf!.add(prof!);
    }
    print("List  $totalProf");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data != null || body != null) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .5,
                        child: SfCartesianChart(
                            palette: [Color(0xFF0C331F)],
                            primaryXAxis:
                                CategoryAxis(title: AxisTitle(text: 'Days')),
                            primaryYAxis: NumericAxis(
                                title: AxisTitle(text: 'Profit / Loss')),
                            series: <ChartSeries>[
                              ColumnSeries<ProfitLoss, String>(
                                  dataSource: <ProfitLoss>[
                                    ProfitLoss(
                                        '1',
                                        double.parse(
                                          body['totalProfit'].toString(),
                                        )),
                                    ProfitLoss(
                                        '2',
                                        double.parse(
                                          body['totalProfit'].toString(),
                                        )),
                                    ProfitLoss(
                                        '3',
                                        double.parse(
                                          body['totalProfit'].toString(),
                                        )),
                                    ProfitLoss(
                                        '4',
                                        double.parse(
                                          body['totalProfit'].toString(),
                                        )),
                                  ],
                                  xValueMapper: (ProfitLoss sales, _) =>
                                      sales.day,
                                  yValueMapper: (ProfitLoss sales, _) =>
                                      sales.profit,
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true))
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Today Profit  =",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFF0C331F))),
                            child: Text(
                              body['totalProfit'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
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
