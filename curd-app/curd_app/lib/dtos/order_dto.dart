import 'package:curd_app/dtos/order_details_dto.dart';
import 'package:object_mapper/object_mapper.dart';

class OrderDTO with Mappable {
  String? id;
  String orderNo;
  String customerId;
  String mobile;
  double totalDiscountPer;
  double totalDiscount;
  List<OrderDetailDTO> details;

  OrderDTO({
    this.id,
    required this.orderNo,
    required this.customerId,
    required this.mobile,
    required this.totalDiscountPer,
    required this.totalDiscount,
    required this.details,
  });

  @override
  void mapping(Mapper map) {
    map("id", id, (v) => id = v);
    map("orderNo", orderNo, (v) => orderNo = v);
    map("customerId", customerId, (v) => customerId = v);
    map("mobile", mobile, (v) => mobile = v);
    map("totalDiscountPer", totalDiscountPer, (v) => totalDiscountPer = v);
    map("totalDiscount", totalDiscount, (v) => totalDiscount = v);
    map("details", details, (v) => details = v);
    // TODO: implement mapping
  }

  factory OrderDTO.fromJson(Map json) {
    return OrderDTO(
      id: json['id'] == null ? "" : json['id'] as String,
      orderNo: json['orderNo'] == null ? "" : json['orderNo'] as String,
      customerId:
          json['customerId'] == null ? "" : json['customerId'] as String,
      mobile: json['mobile'] == null ? "" : json['mobile'] as String,
      totalDiscountPer: json['totalDiscountPer'] == null
          ? 0
          : json['totalDiscountPer'] as double,
      totalDiscount:
          json['totalDiscount'] == null ? 0 : json['totalDiscount'] as double,
      details: OrderDetailDTO.getList(json['details']),
    );
  }
}
