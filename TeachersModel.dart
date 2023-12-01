class TeachersModel {
  TeachersModel({
      this.id, 
      this.name, 
      this.salary, 
      this.details,});

  TeachersModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    salary = json['Salary'];
    details = json['Details'];
  }
  int? id;
  String? name;
  dynamic? salary;
  String? details;
TeachersModel copyWith({  int? id,
  String? name,
  int? salary,
  String? details,
}) => TeachersModel(  id: id ?? this.id,
  name: name ?? this.name,
  salary: salary ?? this.salary,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Salary'] = salary;
    map['Details'] = details;
    return map;
  }

}