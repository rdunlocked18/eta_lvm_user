class SingleOrder {
  final int? id;
  final int? userId;
  final dynamic orderId;
  final String? platform;
  final String? type;
  final String? state;
  final String? symbol;
  final String? magic;
  final String? time;
  final String? brokerTime;
  final String? openPrice;
  final String? volume;
  final String? currentVolume;
  final String? positionId;
  final String? reason;
  final String? currentPrice;
  final String? accountCurrencyExchangeRate;
  final String? brokerComment;
  final String? stopLoss;
  final String? takeProfit;
  final String? comment;
  final String? clientId;
  final String? updateSequenceNumber;
  final String? createdAt;
  final String? updatedAt;

  SingleOrder({
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

  SingleOrder copyWith({
    int? id,
    int? userId,
    dynamic orderId,
    String? platform,
    String? type,
    String? state,
    String? symbol,
    String? magic,
    String? time,
    String? brokerTime,
    String? openPrice,
    String? volume,
    String? currentVolume,
    String? positionId,
    String? reason,
    String? currentPrice,
    String? accountCurrencyExchangeRate,
    String? brokerComment,
    String? stopLoss,
    String? takeProfit,
    String? comment,
    String? clientId,
    String? updateSequenceNumber,
    String? createdAt,
    String? updatedAt,
  }) {
    return SingleOrder(
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

  SingleOrder.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        orderId = json['orderId'],
        platform = json['platform'] as String?,
        type = json['type'] as String?,
        state = json['state'] as String?,
        symbol = json['symbol'] as String?,
        magic = json['magic'] as String?,
        time = json['time'] as String?,
        brokerTime = json['brokerTime'] as String?,
        openPrice = json['openPrice'] as String?,
        volume = json['volume'] as String?,
        currentVolume = json['currentVolume'] as String?,
        positionId = json['positionId'] as String?,
        reason = json['reason'] as String?,
        currentPrice = json['currentPrice'] as String?,
        accountCurrencyExchangeRate =
            json['accountCurrencyExchangeRate'] as String?,
        brokerComment = json['brokerComment'] as String?,
        stopLoss = json['stopLoss'] as String?,
        takeProfit = json['takeProfit'] as String?,
        comment = json['comment'] as String?,
        clientId = json['clientId'] as String?,
        updateSequenceNumber = json['updateSequenceNumber'] as String?,
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
