import 'package:object_mapper/object_mapper.dart';

class OrderDetailDTO with Mappable {
  String? id;
  double price;
  int qty;
  double lineDiscountPer;
  double lineDiscount;
  double lineValue;
  String? itemCode;

  OrderDetailDTO({
     this.id,
    required this.price,
    required this.qty,
    required this.lineDiscountPer,
    required this.lineDiscount,
    required this.lineValue,
    this.itemCode,
  });

  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
    map("price", price, (v) => price = v);
    map("qty", qty, (v) => qty = v);
    map("lineDiscountPer", lineDiscountPer, (v) => lineDiscountPer = v);
    map("lineDiscount", lineDiscount, (v) => lineDiscount = v);
    map("lineValue", lineValue, (v) => lineValue = v);
    map("itemCode", itemCode, (v) => itemCode = v);
    // TODO: implement mapping
  }

  factory OrderDetailDTO.fromJson(Map json) {
    return OrderDetailDTO(
      id: json['id'] as String,
      price: json['price'] as double,
      qty: json['qty'] as int,
      lineDiscountPer: json['lineDiscountPer'] as double,
      lineDiscount: json['lineDiscount'] as double,
      lineValue: json['lineValue'] as double,
      itemCode: json['itemCode'] as String,
    );
  }

  static List<OrderDetailDTO> getList(List<dynamic> orderList) {
    List<OrderDetailDTO> tempList = [];
    for (var item in orderList) {
      tempList.add(OrderDetailDTO.fromJson(item));
    }

    return tempList;
  }
}
