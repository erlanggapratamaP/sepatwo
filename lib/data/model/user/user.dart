class User {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  String? phone;
  String? roles;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.phone,
    this.roles,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, twoFactorSecret: $twoFactorSecret, twoFactorRecoveryCodes: $twoFactorRecoveryCodes, twoFactorConfirmedAt: $twoFactorConfirmedAt, phone: $phone, roles: $roles)';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    emailVerifiedAt:
        json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at'] as String),
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    twoFactorSecret: json['two_factor_secret'] as dynamic,
    twoFactorRecoveryCodes: json['two_factor_recovery_codes'] as dynamic,
    twoFactorConfirmedAt: json['two_factor_confirmed_at'] as dynamic,
    phone: json['phone'] as String?,
    roles: json['roles'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'email_verified_at': emailVerifiedAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'two_factor_secret': twoFactorSecret,
    'two_factor_recovery_codes': twoFactorRecoveryCodes,
    'two_factor_confirmed_at': twoFactorConfirmedAt,
    'phone': phone,
    'roles': roles,
  };

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic twoFactorSecret,
    dynamic twoFactorRecoveryCodes,
    dynamic twoFactorConfirmedAt,
    String? phone,
    String? roles,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      twoFactorSecret: twoFactorSecret ?? this.twoFactorSecret,
      twoFactorRecoveryCodes:
          twoFactorRecoveryCodes ?? this.twoFactorRecoveryCodes,
      twoFactorConfirmedAt: twoFactorConfirmedAt ?? this.twoFactorConfirmedAt,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
    );
  }
}
