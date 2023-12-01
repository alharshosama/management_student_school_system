class StudentAffairsModel {
  StudentAffairsModel({
      this.id, 
      this.admission, 
      this.register, 
      this.scheduling, 
      this.cards, 
      this.absenceAndAttendance, 
      this.communicationWithParents,});

  StudentAffairsModel.fromJson(dynamic json) {
    id = json['Id'];
    admission = json['Admission'];
    register = json['Register'];
    scheduling = json['Scheduling'];
    cards = json['Cards'];
    absenceAndAttendance = json['Absence_and_Attendance'];
    communicationWithParents = json['Communication_with_Parents'];
  }
  int? id;
  String? admission;
  String? register;
  String? scheduling;
  String? cards;
  String? absenceAndAttendance;
  String? communicationWithParents;
StudentAffairsModel copyWith({  int? id,
  String? admission,
  String? register,
  String? scheduling,
  String? cards,
  String? absenceAndAttendance,
  String? communicationWithParents,
}) => StudentAffairsModel(  id: id ?? this.id,
  admission: admission ?? this.admission,
  register: register ?? this.register,
  scheduling: scheduling ?? this.scheduling,
  cards: cards ?? this.cards,
  absenceAndAttendance: absenceAndAttendance ?? this.absenceAndAttendance,
  communicationWithParents: communicationWithParents ?? this.communicationWithParents,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Admission'] = admission;
    map['Register'] = register;
    map['Scheduling'] = scheduling;
    map['Cards'] = cards;
    map['Absence_and_Attendance'] = absenceAndAttendance;
    map['Communication_with_Parents'] = communicationWithParents;
    return map;
  }

}