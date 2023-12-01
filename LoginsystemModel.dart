class LoginsystemModel {
  LoginsystemModel({
      this.id, 
      this.username, 
      this.password,});

  LoginsystemModel.fromJson(dynamic json) {
    id = json['Id'];
    username = json['username'];
    password = json['password'];
  }
  int? id;
  String? username;
  int? password;
LoginsystemModel copyWith({  int? id,
  String? username,
  int? password,
}) => LoginsystemModel(  id: id ?? this.id,
  username: username ?? this.username,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['username'] = username;
    map['password'] = password;
    return map;
  }

}