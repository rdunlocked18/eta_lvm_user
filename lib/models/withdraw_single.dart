class WithdrawSingle {
  final int? id;
  final int? userId;
  final int? methodId;
  final String? method;
  final String? amount;
  final String? createdAt;
  final String? updatedAt;

  WithdrawSingle({
    this.id,
    this.userId,
    this.methodId,
    this.method,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  WithdrawSingle copyWith({
    int? id,
    int? userId,
    int? methodId,
    String? method,
    String? amount,
    String? createdAt,
    String? updatedAt,
  }) {
    return WithdrawSingle(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      methodId: methodId ?? this.methodId,
      method: method ?? this.method,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  WithdrawSingle.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        methodId = json['methodId'] as int?,
        method = json['method'] as String?,
        amount = json['amount'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'methodId': methodId,
        'method': method,
        'amount': amount,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
