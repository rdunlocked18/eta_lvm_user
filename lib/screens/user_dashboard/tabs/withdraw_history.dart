import 'package:flutter/material.dart';
import 'package:locked_wallet/constants.dart';
import 'package:locked_wallet/models/withdraw_single.dart';
import 'package:locked_wallet/services/withdraw_api_service.dart';

import '../../../common_widget/reusable_tableRow.dart';

class WithdrawHistory extends StatefulWidget {
  const WithdrawHistory({Key? key}) : super(key: key);

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  List<WithdrawSingle> withdrawSingles = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getListOfWithDraws();
  }

  void getListOfWithDraws() async {
    isLoading = true;
    List<WithdrawSingle>? _as = await getAllUserWithdraws();
    if (_as != null) {
      withdrawSingles.addAll(_as);
    }
    print(withdrawSingles);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 8, 44, 9),
            ),
          )
        : withdrawSingles.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('No Withdrawals found'),
                  )
                ],
              )
            : Column(
                children: [
                  WithdrawTable(
                    firstList: ['Withdraw Method', 'Amount', 'Date'],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: withdrawSingles.length,
                    itemBuilder: (contex, index) {
                      return GestureDetector(
                        onTap: () {
                          print(withdrawSingles[index].createdAt.toString());
                        },
                        child: Column(
                          children: [
                            WithdrawTable(
                              firstList: [
                                '${withdrawSingles[index].method}',
                                '${withdrawSingles[index].amount}',
                                getvalidDate(
                                  '${withdrawSingles[index].createdAt}',
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
  }
}

Table WithdrawTable({
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
      1: FractionColumnWidth(0.25),
      2: FractionColumnWidth(0.25),
      3: FractionColumnWidth(0.25),
      4: FractionColumnWidth(0.25),
    },
    children: [
      ReusableTableRow(firstList),
    ],
  );
}
