import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:locked_wallet/constants.dart';
import 'package:locked_wallet/models/withdraw_method_model.dart';
import 'package:locked_wallet/services/withdraw_api_service.dart';

class WithdrawAddress extends StatefulWidget {
  const WithdrawAddress({Key? key}) : super(key: key);

  @override
  State<WithdrawAddress> createState() => _WithdrawAddressState();
}

class _WithdrawAddressState extends State<WithdrawAddress> {
  List<String> _bankItems = [
    'Bank Wire',
    'Crypto Wallet',
  ];
  String? _wallet;
  String? _bank;
  String? _bbnk;
  bool isCryptoSelected = false;
  bool isLoading = false;

  TextEditingController walletAddressController = TextEditingController();
  TextEditingController confirmWalletAddressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    getMethods();
  }

  List<WithdrawMethod>? methods = [];
  List<String> bankAccountnumbers = [];
  List<String> walletIds = [];

  void getMethods() async {
    walletIds = [];
    bankAccountnumbers = [];
    isLoading = true;
    methods = await getAllWithdrawMethods();
    if (methods!.isNotEmpty) {
      methods?.forEach((element) {
        if (element.bankacc != '') {
          bankAccountnumbers.add(element.bankacc!);
        } else if (element.cryptoid != '') {
          walletIds.add(element.cryptoid!);
        }
      });
    }
    print(bankAccountnumbers);
    print(walletIds);
    isLoading = false;
    setState(() {});
  }

  void saveMethod() async {
    print(_bank);
    print(_wallet);

    if (walletAddressController.text == confirmWalletAddressController.text &&
        walletAddressController.text.length > 5) {
      if (isCryptoSelected) {
        await saveWithdrawAddress(
          method: _bank,
          crypto: walletAddressController.text,
        );
      } else {
        await saveWithdrawAddress(
          method: _bank,
          bank: walletAddressController.text,
        );
      }
      getMethods();
    } else {
      Fluttertoast.showToast(
          msg: 'Numbers Did not Match | Ac/No Must be Greater Than 5');
    }

    setState(() {});
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF0C331F), width: 1)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: _bank,
                    borderRadius: BorderRadius.circular(10),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    hint: Text(
                      "Select Method",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    items: _bankItems
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        if (v == _bankItems[1]) {
                          isCryptoSelected = true;
                        } else {
                          isCryptoSelected = false;
                        }
                        _bank = v!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (isCryptoSelected)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF0C331F), width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _wallet,
                      borderRadius: BorderRadius.circular(10),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      hint: Text(
                        "Select Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      items: walletIds
                          .map((e) => DropdownMenuItem<String>(
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _wallet = v!;
                        });
                      },
                    ),
                  ),
                ),
              if (!isCryptoSelected)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF0C331F), width: 1)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _bbnk,
                      borderRadius: BorderRadius.circular(10),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                      hint: Text(
                        "Select Bank",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      items: bankAccountnumbers
                          .map((e) => DropdownMenuItem<String>(
                                child: Text(
                                  e,
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _bbnk = v!;
                        });
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Add Wallet",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: walletAddressController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText:
                      isCryptoSelected ? 'Wallet Address' : 'Bank AC Number',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF0C331F), width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF0C331F), width: 1)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: confirmWalletAddressController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: isCryptoSelected
                      ? 'Confirm Wallet Address'
                      : 'Confirm Bank Ac Number',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF0C331F), width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color(0xFF0C331F), width: 1)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0C331F)),
                  onPressed: () {
                    saveMethod();
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          );
  }
}
