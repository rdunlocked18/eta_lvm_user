class AllUserDetails {
  final User? user;
  final List<Orders>? orders;
  final List<dynamic>? positions;
  final List<dynamic>? withdrawals;
  final List<dynamic>? withdrawalMethods;
  final List<dynamic>? withdrawalsettings;

  AllUserDetails({
    this.user,
    this.orders,
    this.positions,
    this.withdrawals,
    this.withdrawalMethods,
    this.withdrawalsettings,
  });

  AllUserDetails copyWith({
    User? user,
    List<Orders>? orders,
    List<dynamic>? positions,
    List<dynamic>? withdrawals,
    List<dynamic>? withdrawalMethods,
    List<dynamic>? withdrawalsettings,
  }) {
    return AllUserDetails(
      user: user ?? this.user,
      orders: orders ?? this.orders,
      positions: positions ?? this.positions,
      withdrawals: withdrawals ?? this.withdrawals,
      withdrawalMethods: withdrawalMethods ?? this.withdrawalMethods,
      withdrawalsettings: withdrawalsettings ?? this.withdrawalsettings,
    );
  }

  AllUserDetails.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        orders = (json['orders'] as List?)
            ?.map((dynamic e) => Orders.fromJson(e as Map<String, dynamic>))
            .toList(),
        positions = json['positions'] as List?,
        withdrawals = json['withdrawals'] as List?,
        withdrawalMethods = json['withdrawalMethods'] as List?,
        withdrawalsettings = json['withdrawalsettings'] as List?;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'orders': orders?.map((e) => e.toJson()).toList(),
        'positions': positions,
        'withdrawals': withdrawals,
        'withdrawalMethods': withdrawalMethods,
        'withdrawalsettings': withdrawalsettings
      };
}

class User {
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  final String? address;
  final String? phone;
  final String? accountId;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.username,
    this.password,
    this.email,
    this.address,
    this.phone,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? email,
    String? address,
    String? phone,
    String? accountId,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      accountId: accountId ?? this.accountId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        username = json['username'] as String?,
        password = json['password'] as String?,
        email = json['email'] as String?,
        address = json['address'] as String?,
        phone = json['phone'] as String?,
        accountId = json['accountId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
        'email': email,
        'address': address,
        'phone': phone,
        'accountId': accountId,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}

class Orders {
  final int? id;
  final int? userId;
  final String? orderId;
  final dynamic platform;
  final String? type;
  final dynamic state;
  final String? symbol;
  final dynamic magic;
  final dynamic time;
  final dynamic brokerTime;
  final String? openPrice;
  final String? volume;
  final dynamic currentVolume;
  final String? positionId;
  final dynamic reason;
  final dynamic currentPrice;
  final dynamic accountCurrencyExchangeRate;
  final dynamic brokerComment;
  final dynamic stopLoss;
  final String? takeProfit;
  final dynamic comment;
  final dynamic clientId;
  final dynamic updateSequenceNumber;
  final String? createdAt;
  final String? updatedAt;

  Orders({
    this.id,
    this.userId,
    this.orderId,
    this.platform,
    this.type,
    this.state,
    this.symbol,
    this.magic,
    this.time,
    this.brokerTime,
    this.openPrice,
    this.volume,
    this.currentVolume,
    this.positionId,
    this.reason,
    this.currentPrice,
    this.accountCurrencyExchangeRate,
    this.brokerComment,
    this.stopLoss,
    this.takeProfit,
    this.comment,
    this.clientId,
    this.updateSequenceNumber,
    this.createdAt,
    this.updatedAt,
  });

  Orders copyWith({
    int? id,
    int? userId,
    String? orderId,
    dynamic platform,
    String? type,
    dynamic state,
    String? symbol,
    dynamic magic,
    dynamic time,
    dynamic brokerTime,
    String? openPrice,
    String? volume,
    dynamic currentVolume,
    String? positionId,
    dynamic reason,
    dynamic currentPrice,
    dynamic accountCurrencyExchangeRate,
    dynamic brokerComment,
    dynamic stopLoss,
    String? takeProfit,
    dynamic comment,
    dynamic clientId,
    dynamic updateSequenceNumber,
    String? createdAt,
    String? updatedAt,
  }) {
    return Orders(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderId: orderId ?? this.orderId,
      platform: platform ?? this.platform,
      type: type ?? this.type,
      state: state ?? this.state,
      symbol: symbol ?? this.symbol,
      magic: magic ?? this.magic,
      time: time ?? this.time,
      brokerTime: brokerTime ?? this.brokerTime,
      openPrice: openPrice ?? this.openPrice,
      volume: volume ?? this.volume,
      currentVolume: currentVolume ?? this.currentVolume,
      positionId: positionId ?? this.positionId,
      reason: reason ?? this.reason,
      currentPrice: currentPrice ?? this.currentPrice,
      accountCurrencyExchangeRate:
          accountCurrencyExchangeRate ?? this.accountCurrencyExchangeRate,
      brokerComment: brokerComment ?? this.brokerComment,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      comment: comment ?? this.comment,
      clientId: clientId ?? this.clientId,
      updateSequenceNumber: updateSequenceNumber ?? this.updateSequenceNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Orders.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        orderId = json['orderId'] as String?,
        platform = json['platform'],
        type = json['type'] as String?,
        state = json['state'],
        symbol = json['symbol'] as String?,
        magic = json['magic'],
        time = json['time'],
        brokerTime = json['brokerTime'],
        openPrice = json['openPrice'] as String?,
        volume = json['volume'] as String?,
        currentVolume = json['currentVolume'],
        positionId = json['positionId'] as String?,
        reason = json['reason'],
        currentPrice = json['currentPrice'],
        accountCurrencyExchangeRate = json['accountCurrencyExchangeRate'],
        brokerComment = json['brokerComment'],
        stopLoss = json['stopLoss'],
        takeProfit = json['takeProfit'] as String?,
        comment = json['comment'],
        clientId = json['clientId'],
        updateSequenceNumber = json['updateSequenceNumber'],
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'orderId': orderId,
        'platform': platform,
        'type': type,
        'state': state,
        'symbol': symbol,
        'magic': magic,
        'time': time,
        'brokerTime': brokerTime,
        'openPrice': openPrice,
        'volume': volume,
        'currentVolume': currentVolume,
        'positionId': positionId,
        'reason': reason,
        'currentPrice': currentPrice,
        'accountCurrencyExchangeRate': accountCurrencyExchangeRate,
        'brokerComment': brokerComment,
        'stopLoss': stopLoss,
        'takeProfit': takeProfit,
        'comment': comment,
        'clientId': clientId,
        'updateSequenceNumber': updateSequenceNumber,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
