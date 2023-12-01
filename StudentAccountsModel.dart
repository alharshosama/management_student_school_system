class StudentAccountsModel {
  StudentAccountsModel({
      this.id, 
      this.name, 
      this.email, 
      this.password,});

  StudentAccountsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
  }
  int? id;
  String? name;
  String? email;
  dynamic? password;
StudentAccountsModel copyWith({  int? id,
  String? name,
  String? email,
  int? password,
}) => StudentAccountsModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Email'] = email;
    map['Password'] = password;
    return map;
  }

}