class ReceptionGateModel {
  ReceptionGateModel({
      this.id, 
      this.responsible, 
      this.reception, 
      this.gate,});

  ReceptionGateModel.fromJson(dynamic json) {
    id = json['Id'];
    responsible = json['Responsible'];
    reception = json['Reception'];
    gate = json['Gate'];
  }
  int? id;
  String? responsible;
  String? reception;
  String? gate;
ReceptionGateModel copyWith({  int? id,
  String? responsible,
  String? reception,
  String? gate,
}) => ReceptionGateModel(  id: id ?? this.id,
  responsible: responsible ?? this.responsible,
  reception: reception ?? this.reception,
  gate: gate ?? this.gate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Responsible'] = responsible;
    map['Reception'] = reception;
    map['Gate'] = gate;
    return map;
  }

}