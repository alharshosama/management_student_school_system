class AccountmanagementModel {
  AccountmanagementModel({
      this.id, 
      this.name, 
      this.email, 
      this.password, 
      this.positions,});

  AccountmanagementModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
    positions = json['Positions'];
  }
  int? id;
  String? name;
  String? email;
  dynamic? password;
  String? positions;
AccountmanagementModel copyWith({  int? id,
  String? name,
  String? email,
  int? password,
  String? positions,
}) => AccountmanagementModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  positions: positions ?? this.positions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Email'] = email;
    map['Password'] = password;
    map['Positions'] = positions;
    return map;
  }

}