import 'package:dio/dio.dart';
import 'package:locked_wallet/models/user_single_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

Future<List<SingleOrder>?> getAllUserOrders() async {
  try {
    SharedPreferences mainPref = await SharedPreferences.getInstance();
    String token = mainPref.getString("token") ?? '';
    Response response = await dio.get(
      '$base_url/api/auth/user',
      options: Options(
        headers: {'Authorization': token},
      ),
    );

    if (response.statusCode == 200) {
      // List data = jsonDecode(sampleOrder);
      List data = response.data['orders'];
      List<SingleOrder> realData = [];
      data.forEach((element) {
        SingleOrder withdraw = SingleOrder.fromJson(element);
        realData.add(withdraw);
      });
      return realData;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
    return null;
  }
}

String sampleOrder = '''[
    {
        "id": 3,
        "userId": 3,
        "orderId": null,
        "platform": "mt5",
        "type": "ORDER_TYPE_BUY_LIMIT",
        "state": "ORDER_STATE_PLACED",
        "symbol": "GBPUSD",
        "magic": "0",
        "time": "2022-12-01T11:54:41.461Z",
        "brokerTime": "2022-12-01 13:54:41.461",
        "openPrice": "1",
        "volume": "0.07",
        "currentVolume": "0.07",
        "positionId": "50290422858",
        "reason": "ORDER_REASON_EXPERT",
        "currentPrice": "1.21379",
        "accountCurrencyExchangeRate": "1",
        "brokerComment": "TE_GBPUSD_7hyINWqAlE:comm",
        "stopLoss": "0.9",
        "takeProfit": "2",
        "comment": "comm",
        "clientId": "TE_GBPUSD_7hyINWqAlE",
        "updateSequenceNumber": "1670236115053002",
        "createdAt": "2022-12-06T21:01:45.834Z",
        "updatedAt": "2022-12-06T21:01:45.834Z"
    },
    {
        "id": 4,
        "userId": 3,
        "orderId": null,
        "platform": "mt5",
        "type": "ORDER_TYPE_BUY_LIMIT",
        "state": "ORDER_STATE_PLACED",
        "symbol": "GBPUSD",
        "magic": "0",
        "time": "2022-12-01T11:54:41.461Z",
        "brokerTime": "2022-12-01 13:54:41.461",
        "openPrice": "1",
        "volume": "0.07",
        "currentVolume": "0.07",
        "positionId": "50290422858",
        "reason": "ORDER_REASON_EXPERT",
        "currentPrice": "1.21376",
        "accountCurrencyExchangeRate": "1",
        "brokerComment": "TE_GBPUSD_7hyINWqAlE:comm",
        "stopLoss": "0.9",
        "takeProfit": "2",
        "comment": "comm",
        "clientId": "TE_GBPUSD_7hyINWqAlE",
        "updateSequenceNumber": "1670236115053002",
        "createdAt": "2022-12-06T21:02:25.629Z",
        "updatedAt": "2022-12-06T21:02:25.629Z"
    },
    {
        "id": 5,
        "userId": 3,
        "orderId": "50290422858",
        "platform": "mt5",
        "type": "ORDER_TYPE_BUY_LIMIT",
        "state": "ORDER_STATE_PLACED",
        "symbol": "GBPUSD",
        "magic": "0",
        "time": "2022-12-01T11:54:41.461Z",
        "brokerTime": "2022-12-01 13:54:41.461",
        "openPrice": "1",
        "volume": "0.07",
        "currentVolume": "0.07",
        "positionId": "50290422858",
        "reason": "ORDER_REASON_EXPERT",
        "currentPrice": "1.21356",
        "accountCurrencyExchangeRate": "1",
        "brokerComment": "TE_GBPUSD_7hyINWqAlE:comm",
        "stopLoss": "0.9",
        "takeProfit": "2",
        "comment": "comm",
        "clientId": "TE_GBPUSD_7hyINWqAlE",
        "updateSequenceNumber": "1670236115053002",
        "createdAt": "2022-12-06T21:03:35.656Z",
        "updatedAt": "2022-12-06T21:03:35.656Z"
    },
    {
        "id": 6,
        "userId": 3,
        "orderId": "50290422858",
        "platform": "mt5",
        "type": "ORDER_TYPE_BUY_LIMIT",
        "state": "ORDER_STATE_PLACED",
        "symbol": "GBPUSD",
        "magic": "0",
        "time": "2022-12-01T11:54:41.461Z",
        "brokerTime": "2022-12-01 13:54:41.461",
        "openPrice": "1",
        "volume": "0.07",
        "currentVolume": "0.07",
        "positionId": "50290422858",
        "reason": "ORDER_REASON_EXPERT",
        "currentPrice": "1.21353",
        "accountCurrencyExchangeRate": "1",
        "brokerComment": "TE_GBPUSD_7hyINWqAlE:comm",
        "stopLoss": "0.9",
        "takeProfit": "2",
        "comment": "comm",
        "clientId": "TE_GBPUSD_7hyINWqAlE",
        "updateSequenceNumber": "1670236115053002",
        "createdAt": "2022-12-06T21:03:52.997Z",
        "updatedAt": "2022-12-06T21:03:52.997Z"
    }
]''';
