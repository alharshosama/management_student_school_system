class SchoolControlModel {
  SchoolControlModel({
      this.id, 
      this.name, 
      this.principal, 
      this.vicePrincipal,});

  SchoolControlModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    principal = json['Principal'];
    vicePrincipal = json['Vice_Principal'];
  }
  int? id;
  String? name;
  String? principal;
  String? vicePrincipal;
SchoolControlModel copyWith({  int? id,
  String? name,
  String? principal,
  String? vicePrincipal,
}) => SchoolControlModel(  id: id ?? this.id,
  name: name ?? this.name,
  principal: principal ?? this.principal,
  vicePrincipal: vicePrincipal ?? this.vicePrincipal,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Principal'] = principal;
    map['Vice_Principal'] = vicePrincipal;
    return map;
  }

}