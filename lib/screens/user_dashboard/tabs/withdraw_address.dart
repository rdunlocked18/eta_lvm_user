import 'package:flutter/material.dart';

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
  List<String> _walletItems = [
    'Wallet 1',
    'Wallet 2',
  ];
  String? _bank;

  TextEditingController walletAddressController = TextEditingController();
  TextEditingController confirmWalletAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Select Bank",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
                  _bank = v!;
                });
              },
            ),
          ),
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
              value: _wallet,
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              hint: Text(
                "Select Wallet",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              items: _walletItems
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
            hintText: 'Wallet Address',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: confirmWalletAddressController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Confirm Wallet Address',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0C331F), width: 1)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0C331F)),
            onPressed: () {},
            child: Text("Save"),
          ),
        ),
      ],
    );
  }
}
