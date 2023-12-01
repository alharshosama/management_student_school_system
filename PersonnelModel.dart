class PersonnelModel {
  PersonnelModel({
      this.id, 
      this.name, 
      this.position,});

  PersonnelModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    position = json['Position'];
  }
  int? id;
  String? name;
  String? position;
PersonnelModel copyWith({  int? id,
  String? name,
  String? position,
}) => PersonnelModel(  id: id ?? this.id,
  name: name ?? this.name,
  position: position ?? this.position,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Position'] = position;
    return map;
  }

}