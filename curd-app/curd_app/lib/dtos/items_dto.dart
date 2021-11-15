import 'package:object_mapper/object_mapper.dart';

class ItemDTO with Mappable {
  ItemDTO({
    this.id,
    this.itemCode,
    required this.itemName,
    required this.aviableQty,
    required this.itemPrice,
    this.addItemForSale = 0,
    this.isSelected = false,
  });

  String? id;
  String? itemCode;
  String itemName;
  double itemPrice;
  double aviableQty;
  int addItemForSale;
  bool isSelected;

  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
    map("itemCode", itemCode, (v) => itemCode = v);
    map("itemName", itemName, (v) => itemName = v);
    map("itemPrice", itemPrice, (v) => itemPrice = v);
    map("aviableQty", aviableQty, (v) => aviableQty = v);
    // TODO: implement mapping
  }

  factory ItemDTO.fromJson(Map json) {
    return ItemDTO(
      id: json['id'] as String,
      itemCode: json['itemCode'] as String,
      itemName: json['itemName'] as String,
      aviableQty: json['aviableQty'] as double,
      itemPrice: json['itemPrice'] as double,
    );
  }
}
