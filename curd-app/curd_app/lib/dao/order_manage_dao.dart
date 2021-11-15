import 'dart:convert';

import 'package:curd_app/dao/http_caller.dart';
import 'package:curd_app/dtos/order_dto.dart';

class OrderDetialsDao {
  HttpCaller _httpCaller = HttpCaller();
  String urlPart = 'orders';

  //  Save Order
  Future<OrderDTO> saveOrder({required OrderDTO order}) async {
    var response = await _httpCaller.postMapping(
        urlPart: "${urlPart}/save", object: order);
    final Map parsed = json.decode(response.body);
    return OrderDTO.fromJson((parsed));
  }

  Future<int> countAll() async {
    var response = await _httpCaller.getMapping(urlPart: "${urlPart}/countAll");
    return int.parse(response.body);
  }
}
