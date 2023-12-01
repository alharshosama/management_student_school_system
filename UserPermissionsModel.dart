class UserPermissionsModel {
  UserPermissionsModel({
      this.id, 
      this.user, 
      this.permissions,});

  UserPermissionsModel.fromJson(dynamic json) {
    id = json['Id'];
    user = json['User'];
    permissions = json['Permissions'];
  }
  int? id;
  String? user;
  String? permissions;
UserPermissionsModel copyWith({  int? id,
  String? user,
  String? permissions,
}) => UserPermissionsModel(  id: id ?? this.id,
  user: user ?? this.user,
  permissions: permissions ?? this.permissions,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['User'] = user;
    map['Permissions'] = permissions;
    return map;
  }

}