class StudentReportModel {
  StudentReportModel({
      this.id, 
      this.performance, 
      this.attendanceAndAbsenceReport, 
      this.disciplineAndConductReport, 
      this.personalDevelopmentReport, 
      this.homeLinkageReport, 
      this.testReportsAndevaluation,});

  StudentReportModel.fromJson(dynamic json) {
    id = json['Id'];
    performance = json['Performance'];
    attendanceAndAbsenceReport = json['Attendance_and_absence_report'];
    disciplineAndConductReport = json['Discipline_and_conduct_report'];
    personalDevelopmentReport = json['Personal_development_report'];
    homeLinkageReport = json['Home_linkage_report'];
    testReportsAndevaluation = json['Test_reports_andevaluation'];
  }
  int? id;
  String? performance;
  String? attendanceAndAbsenceReport;
  String? disciplineAndConductReport;
  String? personalDevelopmentReport;
  String? homeLinkageReport;
  String? testReportsAndevaluation;
StudentReportModel copyWith({  int? id,
  String? performance,
  String? attendanceAndAbsenceReport,
  String? disciplineAndConductReport,
  String? personalDevelopmentReport,
  String? homeLinkageReport,
  String? testReportsAndevaluation,
}) => StudentReportModel(  id: id ?? this.id,
  performance: performance ?? this.performance,
  attendanceAndAbsenceReport: attendanceAndAbsenceReport ?? this.attendanceAndAbsenceReport,
  disciplineAndConductReport: disciplineAndConductReport ?? this.disciplineAndConductReport,
  personalDevelopmentReport: personalDevelopmentReport ?? this.personalDevelopmentReport,
  homeLinkageReport: homeLinkageReport ?? this.homeLinkageReport,
  testReportsAndevaluation: testReportsAndevaluation ?? this.testReportsAndevaluation,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Performance'] = performance;
    map['Attendance_and_absence_report'] = attendanceAndAbsenceReport;
    map['Discipline_and_conduct_report'] = disciplineAndConductReport;
    map['Personal_development_report'] = personalDevelopmentReport;
    map['Home_linkage_report'] = homeLinkageReport;
    map['Test_reports_andevaluation'] = testReportsAndevaluation;
    return map;
  }

}