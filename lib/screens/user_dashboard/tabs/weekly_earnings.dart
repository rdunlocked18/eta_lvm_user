import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

class WeeklyEarning extends StatefulWidget {
  const WeeklyEarning({Key? key}) : super(key: key);

  @override
  State<WeeklyEarning> createState() => _WeeklyEarningState();
}

class _WeeklyEarningState extends State<WeeklyEarning> {
  void initState() {
    super.initState();
    firstWeek();
    secondWeek();
    thirdWeek();
    forthWeek();
  }

  firstWeek() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? "";
    var headers = {
      'Authorization': token,
    };
    var request =
        http.Request('GET', Uri.parse('$base_url/api/user/week1/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("body is == $body");
      weekOne = body['totalProfit'];
      print(" wee body is == $weekOne");
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  secondWeek() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? "";
    var headers = {
      'Authorization': token,
      'Cookie':
          'connect.sid=s%3ABr9bRA-jt_G2RaOu2kIF14zAVXsF4kI0.gkCq6rVfjMANN9wrOKV%2B4iyjVhJySyaPbLOny%2BUc1ho'
    };
    var request =
        http.Request('GET', Uri.parse('$base_url/api/user/week2/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      weekTwo = body['totalProfit'];

      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  thirdWeek() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? "";
    var headers = {
      'Authorization': token,
    };
    var request =
        http.Request('GET', Uri.parse('$base_url/api/user/week3/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      weekThree = body['totalProfit'];

      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  forthWeek() async {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? "";
    var headers = {
      'Authorization': token,
    };
    var request =
        http.Request('GET', Uri.parse('$base_url/api/user/week4/profit'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      setState(() {
        weekFour = body['totalProfit'];
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  // var  message;
  var weekOne;
  var weekTwo;
  var weekThree;
  var weekFour;

  @override
  Widget build(BuildContext context) {
    return weekThree == null &&
            weekTwo == null &&
            weekFour == null &&
            weekOne == null
        ? Center(
            child: CircularProgressIndicator(
              color: baseColor,
            ),
          )
        : ListView.builder(
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
                            CategoryAxis(title: AxisTitle(text: 'Weeks')),
                        primaryYAxis:
                            NumericAxis(title: AxisTitle(text: 'Earnings')),
                        series: <ChartSeries>[
                          ColumnSeries<EarningModel, String>(
                              dataSource: <EarningModel>[
                                EarningModel(
                                    'Week 1',
                                    double.parse(weekOne == null
                                        ? "0"
                                        : weekOne.toString())),
                                EarningModel(
                                    'Week 2',
                                    double.parse(weekTwo == null
                                        ? "0"
                                        : weekTwo.toString())),
                                EarningModel(
                                    'Week 3',
                                    double.parse(weekThree == null
                                        ? "0"
                                        : weekThree.toString())),
                                EarningModel(
                                    'Week 4',
                                    double.parse(weekFour == null
                                        ? "0"
                                        : weekFour.toString())),
                              ],
                              xValueMapper: (EarningModel sales, _) =>
                                  sales.week,
                              yValueMapper: (EarningModel sales, _) =>
                                  sales.earning,
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
                        "This Week Earning  =",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          firstWeek();
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFF0C331F))),
                          child: weekOne == null
                              ? CircularProgressIndicator()
                              : Text(
                                  weekOne.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            });
  }

  // static getToken() async {
  //   SharedPreferences mainPref = await SharedPreferences.getInstance();
  //   var token = mainPref.getString("token");
  //   return token;
  // }
}

class EarningModel {
  EarningModel(this.week, this.earning);
  final String week;
  final double earning;
}
