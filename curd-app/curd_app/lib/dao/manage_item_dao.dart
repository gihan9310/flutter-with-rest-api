import 'dart:convert';

import 'package:curd_app/dao/http_caller.dart';
import 'package:curd_app/dtos/items_dto.dart';

class ManageItemDao {
  HttpCaller _httpCaller = HttpCaller();
  String _urlPart = 'items/';

//  Save Items
  Future<ItemDTO?> saveItem({required ItemDTO item}) async {
    try {
      var response = await _httpCaller.postMapping(
          urlPart: '${_urlPart}save', object: item);
      final Map parsed = json.decode(response.body);
      return ItemDTO.fromJson((parsed));
    } catch (e) {
      print(e);
      return null;
    }
  }

  //  find All

  Future<List<ItemDTO>?> getAllItems({required String urlPath}) async {
    try {
      var response =
          await _httpCaller.getMapping(urlPart: '${_urlPart}/${urlPath}');
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ItemDTO>((json) => ItemDTO.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> deleteItem(String? id) async {
    try {
      var res =
          await _httpCaller.deleteMapping(urlPart: "${_urlPart}/delete/${id}");
      return res.body;
    } catch (e) {
      return null;
    }
  }

  Future<ItemDTO?> updateItem(ItemDTO? itemForUpdate) async {
    try {
      var result = await _httpCaller.putMapping(
          urlPart: "${_urlPart}/update", object: itemForUpdate);
      final Map parsed = json.decode(result.body);
      return ItemDTO.fromJson((parsed));
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> countAllItems() async {
    try {
      var result =
          await _httpCaller.getMapping(urlPart: "${_urlPart}/countAll");
      return int.parse(result.body);
    } catch (e) {
      print(e);
      return 0;
    }
  }
}
