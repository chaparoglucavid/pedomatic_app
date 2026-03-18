class UsersModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String birthdate;
  final String activityStatus;
  final String systemStatus;
  final String userCurrentBalance;
  final String type;
  final String createdAt;
  final dynamic activePackage;

  UsersModel(
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.birthdate,
    this.activityStatus,
    this.systemStatus,
    this.userCurrentBalance,
    this.type,
    this.createdAt,
    this.activePackage,
  );

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      (json['id'] ?? '').toString(),
      (json['fullName'] ?? '').toString(),
      (json['email'] ?? '').toString(),
      (json['phone'] ?? '').toString(),
      (json['birthdate'] ?? '').toString(),
      (json['activityStatus'] ?? '').toString(),
      (json['systemStatus'] ?? '').toString(),
      (json['userCurrentBalance'] ?? '').toString(),
      (json['type'] ?? '').toString(),
      (json['createdAt'] ?? '').toString(),
      (json['activePackage'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthdate'] = this.birthdate;
    data['activityStatus'] = this.activityStatus;
    data['systemStatus'] = this.systemStatus;
    data['userCurrentBalance'] = this.userCurrentBalance;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;

    return data;
  }
}
