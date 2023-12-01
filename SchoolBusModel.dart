class SchoolBusModel {
  SchoolBusModel({
      this.id, 
      this.driver, 
      this.bus, 
      this.phoneNumber,});

  SchoolBusModel.fromJson(dynamic json) {
    id = json['Id'];
    driver = json['Driver'];
    bus = json['Bus'];
    phoneNumber = json['PhoneNumber'];
  }
  int? id;
  String? driver;
  String? bus;
  dynamic? phoneNumber;
SchoolBusModel copyWith({  int? id,
  String? driver,
  String? bus,
  int? phoneNumber,
}) => SchoolBusModel(  id: id ?? this.id,
  driver: driver ?? this.driver,
  bus: bus ?? this.bus,
  phoneNumber: phoneNumber ?? this.phoneNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Driver'] = driver;
    map['Bus'] = bus;
    map['PhoneNumber'] = phoneNumber;
    return map;
  }

}