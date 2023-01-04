class WithdrawMethod {
  final int? id;
  final int? userId;
  final String? method;
  final String? bankacc;
  final String? cryptoid;
  final String? createdAt;
  final String? updatedAt;

  WithdrawMethod({
    this.id,
    this.userId,
    this.method,
    this.bankacc,
    this.cryptoid,
    this.createdAt,
    this.updatedAt,
  });

  WithdrawMethod copyWith({
    int? id,
    int? userId,
    String? method,
    String? bankacc,
    String? cryptoid,
    String? createdAt,
    String? updatedAt,
  }) {
    return WithdrawMethod(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      method: method ?? this.method,
      bankacc: bankacc ?? this.bankacc,
      cryptoid: cryptoid ?? this.cryptoid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  WithdrawMethod.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        method = json['method'] as String?,
        bankacc = json['bankacc'] as String?,
        cryptoid = json['cryptoid'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'method': method,
        'bankacc': bankacc,
        'cryptoid': cryptoid,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
