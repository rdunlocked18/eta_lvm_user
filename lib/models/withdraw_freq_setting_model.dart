class WithdrawFreqSetting {
  final int? id;
  final int? userId;
  final String? payoutfreq;
  final String? withdraw;
  final String? compound;
  final String? createdAt;
  final String? updatedAt;

  WithdrawFreqSetting({
    this.id,
    this.userId,
    this.payoutfreq,
    this.withdraw,
    this.compound,
    this.createdAt,
    this.updatedAt,
  });

  WithdrawFreqSetting copyWith({
    int? id,
    int? userId,
    String? payoutfreq,
    String? withdraw,
    String? compound,
    String? createdAt,
    String? updatedAt,
  }) {
    return WithdrawFreqSetting(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      payoutfreq: payoutfreq ?? this.payoutfreq,
      withdraw: withdraw ?? this.withdraw,
      compound: compound ?? this.compound,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  WithdrawFreqSetting.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        payoutfreq = json['payoutfreq'] as String?,
        withdraw = json['withdraw'] as String?,
        compound = json['compound'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'payoutfreq': payoutfreq,
        'withdraw': withdraw,
        'compound': compound,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
