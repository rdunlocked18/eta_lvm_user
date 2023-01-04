import 'package:flutter/material.dart';
import 'package:locked_wallet/constants.dart';
import 'package:locked_wallet/models/user_dashboard_details.dart';
import 'package:locked_wallet/models/withdraw_freq_setting_model.dart';
import 'package:locked_wallet/services/user_api_service.dart';
import 'package:locked_wallet/services/withdraw_api_service.dart';

class WithdrawFrequencyTab extends StatefulWidget {
  const WithdrawFrequencyTab({Key? key}) : super(key: key);

  @override
  State<WithdrawFrequencyTab> createState() => _WithdrawFrequencyTabState();
}

class _WithdrawFrequencyTabState extends State<WithdrawFrequencyTab> {
  int value1 = 0;
  int value2 = 0;

  List<String> _compoundItems = [
    'Monthly',
    'Bi-Monthly',
  ];
  List<String> _payOutItems = [
    'Monthly',
    'Bi-Monthly',
    'Compound',
    'Compound-Custom',
  ];
  String? _payout;
  String? _compound;
  String? cryptoId;
  String? bankacc;
  WithdrawFreqSetting? settings;
  UserDashboardDetailModel? userdat;

  @override
  void initState() {
    super.initState();
    getWithdawSet();
  }

  bool isLoading = false;

  void getWithdawSet() async {
    isLoading = true;
    WithdrawFreqSetting? _setting = await getWithdrawFreqSettings();
    if (_setting != null) {
      settings = _setting;
      value1 = int.parse(_setting.withdraw ?? '0');
      value2 = int.parse(_setting.compound ?? '0');
      _payout = _setting.payoutfreq;
      userdat = await getUserDashboardDetails();
    }
    setState(() {
      isLoading = false;
    });
  }

  void saveFrequency() async {
    await saveWithdrawFrequencySetting(
      payoutFreq: _payout,
      userId: '${userdat?.userId}',
      value1: value1.toString(),
      value2: value2.toString(),
    );

    setState(() {
      getWithdawSet();
    });
  }

  void incrementValue1() {
    value1++;
  }

  void decrementValue1() {
    value1--;
  }

  void incrementValue2() {
    value2++;
  }

  void decrementValue2() {
    value2--;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: baseColor,
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payout Frequency",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF0C331F), width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _payout,
                    borderRadius: BorderRadius.circular(10),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    hint: Text(
                      "Select",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    items: _payOutItems
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        _payout = v!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Custom Compound",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF0C331F),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "$value1 %",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    incrementValue1();
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    decrementValue1();
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF0C331F),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "$value2 %",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    incrementValue2();
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                  child: Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    decrementValue2();
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                      ),
                                      border: Border.all(color: Colors.white)),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF0C331F), width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _compound,
                    borderRadius: BorderRadius.circular(10),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    hint: Text(
                      "Select",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    items: _compoundItems
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        _compound = v!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0C331F)),
                  onPressed: () {
                    saveFrequency();
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          );
  }
}
