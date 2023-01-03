class UserDashboardDetailModel {
  final int? id;
  final int? userId;
  final String? broker;
  final String? currency;
  final String? server;
  final String? balance;
  final String? equity;
  final String? margin;
  final String? freeMargin;
  final String? leverage;
  final dynamic marginLevel;
  final String? type;
  final String? name;
  final String? login;
  final String? credit;
  final String? platform;
  final String? marginMode;
  final String? tradeAllowed;
  final String? investorMode;
  final String? createdAt;
  final String? updatedAt;

  UserDashboardDetailModel({
    this.id,
    this.userId,
    this.broker,
    this.currency,
    this.server,
    this.balance,
    this.equity,
    this.margin,
    this.freeMargin,
    this.leverage,
    this.marginLevel,
    this.type,
    this.name,
    this.login,
    this.credit,
    this.platform,
    this.marginMode,
    this.tradeAllowed,
    this.investorMode,
    this.createdAt,
    this.updatedAt,
  });

  UserDashboardDetailModel copyWith({
    int? id,
    int? userId,
    String? broker,
    String? currency,
    String? server,
    String? balance,
    String? equity,
    String? margin,
    String? freeMargin,
    String? leverage,
    dynamic marginLevel,
    String? type,
    String? name,
    String? login,
    String? credit,
    String? platform,
    String? marginMode,
    String? tradeAllowed,
    String? investorMode,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserDashboardDetailModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      broker: broker ?? this.broker,
      currency: currency ?? this.currency,
      server: server ?? this.server,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      margin: margin ?? this.margin,
      freeMargin: freeMargin ?? this.freeMargin,
      leverage: leverage ?? this.leverage,
      marginLevel: marginLevel ?? this.marginLevel,
      type: type ?? this.type,
      name: name ?? this.name,
      login: login ?? this.login,
      credit: credit ?? this.credit,
      platform: platform ?? this.platform,
      marginMode: marginMode ?? this.marginMode,
      tradeAllowed: tradeAllowed ?? this.tradeAllowed,
      investorMode: investorMode ?? this.investorMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UserDashboardDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        broker = json['broker'] as String?,
        currency = json['currency'] as String?,
        server = json['server'] as String?,
        balance = json['balance'] as String?,
        equity = json['equity'] as String?,
        margin = json['margin'] as String?,
        freeMargin = json['freeMargin'] as String?,
        leverage = json['leverage'] as String?,
        marginLevel = json['marginLevel'],
        type = json['type'] as String?,
        name = json['name'] as String?,
        login = json['login'] as String?,
        credit = json['credit'] as String?,
        platform = json['platform'] as String?,
        marginMode = json['marginMode'] as String?,
        tradeAllowed = json['tradeAllowed'] as String?,
        investorMode = json['investorMode'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'broker': broker,
        'currency': currency,
        'server': server,
        'balance': balance,
        'equity': equity,
        'margin': margin,
        'freeMargin': freeMargin,
        'leverage': leverage,
        'marginLevel': marginLevel,
        'type': type,
        'name': name,
        'login': login,
        'credit': credit,
        'platform': platform,
        'marginMode': marginMode,
        'tradeAllowed': tradeAllowed,
        'investorMode': investorMode,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
