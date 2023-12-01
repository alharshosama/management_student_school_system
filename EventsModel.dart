class EventsModel {
  EventsModel({
      this.id, 
      this.name, 
      this.date,});

  EventsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    date = json['Date'];
  }
  int? id;
  String? name;
  String? date;
EventsModel copyWith({  int? id,
  String? name,
  String? date,
}) => EventsModel(  id: id ?? this.id,
  name: name ?? this.name,
  date: date ?? this.date,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Date'] = date;
    return map;
  }

}