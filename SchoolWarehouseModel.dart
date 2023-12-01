class SchoolWarehouseModel {
  SchoolWarehouseModel({
      this.id, 
      this.item, 
      this.quantity,});

  SchoolWarehouseModel.fromJson(dynamic json) {
    id = json['Id'];
    item = json['Item'];
    quantity = json['Quantity'];
  }
  int? id;
  dynamic? item;
  String? quantity;
SchoolWarehouseModel copyWith({  int? id,
  int? item,
  String? quantity,
}) => SchoolWarehouseModel(  id: id ?? this.id,
  item: item ?? this.item,
  quantity: quantity ?? this.quantity,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Item'] = item;
    map['Quantity'] = quantity;
    return map;
  }

}