class StudentModel {
  StudentModel({
      this.id, 
      this.name, 
      this.level,});

  StudentModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    level = json['Level'];
  }
  int? id;
  String? name;
  String? level;
StudentModel copyWith({  int? id,
  String? name,
  String? level,
}) => StudentModel(  id: id ?? this.id,
  name: name ?? this.name,
  level: level ?? this.level,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Level'] = level;
    return map;
  }


}