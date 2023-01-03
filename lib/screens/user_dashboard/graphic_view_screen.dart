import 'package:flutter/material.dart';
import 'package:locked_wallet/screens/user_dashboard/tabs/roz_by_week.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Graphs"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 4,
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
                    text: 'Daily',
                  ),
                  Tab(
                    text: 'Weekly',
                  ),
                  Tab(
                    text: 'Monthly',
                  ),
                  Tab(
                    text: "% Roz Week",
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    DailyProfitLoss(),
                    WeeklyEarning(),
                    RunningMonthlyTotalRoz(),
                    RozByWeek(),
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
