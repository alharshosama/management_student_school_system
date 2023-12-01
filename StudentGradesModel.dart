class StudentGradesModel {
  StudentGradesModel({
      this.id, 
      this.name, 
      this.subject, 
      this.grades,});

  StudentGradesModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    subject = json['Subject'];
    grades = json['Grades'];
  }
  int? id;
  String? name;
  String? subject;
  int? grades;
StudentGradesModel copyWith({  int? id,
  String? name,
  String? subject,
  int? grades,
}) => StudentGradesModel(  id: id ?? this.id,
  name: name ?? this.name,
  subject: subject ?? this.subject,
  grades: grades ?? this.grades,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Subject'] = subject;
    map['Grades'] = grades;
    return map;
  }

}