import 'package:curd_app/dao/manage_item_dao.dart';
import 'package:curd_app/dao/order_manage_dao.dart';
import 'package:curd_app/dtos/items_dto.dart';
import 'package:curd_app/dtos/order_details_dto.dart';
import 'package:curd_app/dtos/order_dto.dart';
import 'package:curd_app/utils/message_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OrderManageProvider with ChangeNotifier {
  ManageItemDao _manageItemDao = ManageItemDao();
  OrderDetialsDao _orderDetialsDao = OrderDetialsDao();

  TextEditingController customerName = TextEditingController();
  TextEditingController mobile = TextEditingController();

  List<ItemDTO> listOfItems = [];
  List<ItemDTO> originalList = [];
  List<ItemDTO> orderItemList = [];

  double total = 0;

  OrderManageProvider() {
    AsyncInitialize();
  }

  AsyncInitialize() async {
    await getAllItems();
    await countAllItems();
  }

  getAllItems() async {
    var tempList = await _manageItemDao.getAllItems(urlPath: "findAll");
    listOfItems = tempList ?? [];
    originalList = listOfItems;
    notifyListeners();
  }

  addItems(
      {required int index,
      required bool addYes,
      required BuildContext context}) {
    if (listOfItems[index].isSelected) {
      AlertUtils.showError(
          context: context, message: "Please cancel and add item.");
      return;
    }

    if (addYes) {
      if (listOfItems[index].aviableQty > 0) {
        ++listOfItems[index].addItemForSale;
        --listOfItems[index].aviableQty;
      }
    } else {
      if (listOfItems[index].addItemForSale > 0) {
        --listOfItems[index].addItemForSale;
        ++listOfItems[index].aviableQty;
        print("Calling ${listOfItems[index].addItemForSale} ");
      }
    }
    notifyListeners();
  }

  addToOrder(
      {required int index,
      required bool addToOrder,
      required BuildContext context}) {
    if (listOfItems[index].addItemForSale <= 0) {
      AlertUtils.showError(
          context: context, message: "Please add item ammount");
      return;
    }
    if (addToOrder) {
      listOfItems[index].isSelected = addToOrder;
      addOrderItems();
    } else {
      listOfItems[index].isSelected = addToOrder;
      listOfItems[index].aviableQty += listOfItems[index].addItemForSale;
      listOfItems[index].addItemForSale = 0;
      addOrderItems();
    }
    notifyListeners();
  }

  addOrderItems() {
    orderItemList = [];
    total = 0;
    listOfItems.forEach((element) {
      if (element.isSelected) {
        orderItemList.add(element);
        total += (element.addItemForSale * element.itemPrice);
      }
    });
    print("total ${total}");
    notifyListeners();
    // orderItemList
  }

  saveOrder({required BuildContext context}) async {
    String name = this.customerName.text;
    String mobile = this.mobile.text;

    List<OrderDetailDTO> listOfDetails = [];

    orderItemList.forEach((d) {
      var detail = OrderDetailDTO(
        id: d.id,
        price: d.itemPrice,
        qty: d.addItemForSale,
        lineDiscountPer: 0,
        lineDiscount: 0,
        lineValue: d.addItemForSale * d.itemPrice,
        itemCode: d.itemCode,
      );
      listOfDetails.add(detail);
    });

    OrderDTO order = OrderDTO(
      id: null,
      orderNo: "",
      customerId: name,
      mobile: mobile,
      totalDiscountPer: 0,
      totalDiscount: 0,
      details: listOfDetails,
    );

    var result = await _orderDetialsDao.saveOrder(order: order);

    if (result != null) {
      AlertUtils.showSuccess(
        context: context,
        message: "Order Placed succesfully.",
      );
      clearOrder();
    } else {
      AlertUtils.showError(
        context: context,
        message: "Order not placed",
      );
      clearOrder();
    }

    notifyListeners();
  }

  saveOrderConfirm({required BuildContext context}) {
    if (customerName.text.trim().isEmpty) {
      AlertUtils.showError(
        context: context,
        message: "Please add customer name.",
      );
      return;
    }

    if (mobile.text.trim().isEmpty) {
      AlertUtils.showError(
        context: context,
        message: "Please add customer mobile.",
      );
      return;
    }

    if (orderItemList.isEmpty) {
      AlertUtils.showError(
        context: context,
        message: "Please add order details.",
      );
      return;
    }

    Alert(
      context: context,
      type: AlertType.warning,
      title: "Confirm",
      desc: "Do you want to create order",
      buttons: [
        DialogButton(
          color: Colors.red,
          child: const Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            saveOrder(context: context);
            Navigator.pop(context);
          },
          width: 120,
        ),
        DialogButton(
          color: Colors.blue,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  int orderCount = 0;
  countAllItems() async {
    orderCount = await _orderDetialsDao.countAll();
    notifyListeners();
  }

  clearOrder() {
    orderItemList = [];
    customerName.text = '';
    mobile.text = '';
    total = 0;
    getAllItems();
    countAllItems();
    notifyListeners();
  }
}
