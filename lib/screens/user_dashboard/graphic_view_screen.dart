import 'package:flutter/material.dart';

import 'tabs/daily_profit_loss.dart';
import 'tabs/running_monthl_total_roz.dart';
import 'tabs/weekly_earnings.dart';

class GraphicViewScreen extends StatefulWidget {
  const GraphicViewScreen({Key? key}) : super(key: key);

  @override
  State<GraphicViewScreen> createState() => _GraphicViewScreenState();
}

class _GraphicViewScreenState extends State<GraphicViewScreen> {
  var week1 = [];
  var week2 = [];
  var week3 = [];
  var week4 = [];
  String currency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Graphs"),
      //   foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  DailyProfitLoss(),
                  WeeklyEarning(),
                  RunningMonthlyTotalRoz(),
                ],
              ),
            ),
            TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF0C331F)),
              tabs: [
                Tab(
                  text: 'Daily',
                ),
                Tab(
                  text: 'Weekly',
                ),
                Tab(
                  text: 'Monthly',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
