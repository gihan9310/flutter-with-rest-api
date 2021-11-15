import 'package:curd_app/dao/manage_item_dao.dart';
import 'package:curd_app/dao/order_manage_dao.dart';
import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier {
  ManageItemDao _manageItemDao = ManageItemDao();
  OrderDetialsDao _orderDetialsDao = OrderDetialsDao();
  int countItem = 0;
  int countOrders = 0;

  HomePageProvider() {
    AsyncInitialize();
  }

  AsyncInitialize() async {
    countAllItems();
  }

  void countAllItems() async {
    var data = await _manageItemDao.countAllItems();
    countOrders=await _orderDetialsDao.countAll();
    countItem = data;
    notifyListeners();
  }
}
