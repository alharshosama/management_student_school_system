class MessageModel {
  MessageModel({
      this.id, 
      this.message, 
      this.time,});

  MessageModel.fromJson(dynamic json) {
    id = json['Id'];
    message = json['Message'];
    time = json['Time'];
  }
  int? id;
  String? message;
  String? time;
MessageModel copyWith({  int? id,
  String? message,
  String? time,
}) => MessageModel(  id: id ?? this.id,
  message: message ?? this.message,
  time: time ?? this.time,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Message'] = message;
    map['Time'] = time;
    return map;
  }

}