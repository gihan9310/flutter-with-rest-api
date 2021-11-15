import 'package:curd_app/common/show_loader.dart';
import 'package:curd_app/dao/manage_item_dao.dart';
import 'package:curd_app/dtos/items_dto.dart';
import 'package:curd_app/utils/message_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ManageItemProvider with ChangeNotifier {
  //  DropdownEditingController businessType = DropdownEditingController(value: '');

  TextEditingController itemDiscription = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController itemQty = TextEditingController();
  TextEditingController searchFields = TextEditingController();
  List<ItemDTO> listOfItems = [];
  List<ItemDTO> originalList = [];
  ItemDTO? itemForUpdate = null;

  ManageItemDao _manageItemDao = ManageItemDao();
  bool isLoading = true;

  ManageItemProvider() {
    AsyncInitialize();
    notifyListeners();
    isLoading = false;
  }

  // ignore: non_constant_identifier_names
  AsyncInitialize() async {
    await getAllItems();
    await countAllItems();
  }

  void saveItem({required BuildContext context}) async {
    String itemDiscription = this.itemDiscription.text.trim();
    var itemPrice = double.parse(this.itemPrice.text.trim());
    var itemQty = double.parse(this.itemQty.text.trim());

    var item = ItemDTO(
      itemName: itemDiscription,
      aviableQty: itemQty,
      itemPrice: itemPrice,
    );

    Navigator.pop(context);

    var responseItem = await _manageItemDao.saveItem(item: item);

    if (responseItem != null) {
      AlertUtils.showSuccess(
          context: context, message: "Successfully item created.");
      clearFields();
      getAllItems();
    } else {
      AlertUtils.showError(context: context, message: "Can not save item");
    }
  }

  Future<void> updateItem({required BuildContext context}) async {
    ShowUiBlocker uiBlocker = ShowUiBlocker(context: context);
    uiBlocker.blockUI();

    String itemDiscription = this.itemDiscription.text.trim();
    var itemPrice = double.parse(this.itemPrice.text.trim());
    var itemQty = double.parse(this.itemQty.text.trim());

    itemForUpdate!.itemName = itemDiscription;
    itemForUpdate!.aviableQty = itemQty;
    itemForUpdate!.itemPrice = itemPrice;

    Navigator.pop(context);

    var result = await _manageItemDao.updateItem(itemForUpdate);
    if (result != null) {
      AlertUtils.showSuccess(
          context: context, message: "Item details updated.");
      getAllItems();
      itemForUpdate = null;
      clearFields();
      uiBlocker.blockUI();
    } else {
      AlertUtils.showError(context: context, message: "Can not update item");
      uiBlocker.blockUI();
    }
  }

  getAllItems() async {
    var tempList = await _manageItemDao.getAllItems(urlPath: "findAll");
    listOfItems = tempList ?? [];
    originalList = listOfItems;
    notifyListeners();
  }

  deleteItem({required ItemDTO item, required BuildContext context}) async {
    ShowUiBlocker uiBlocker = ShowUiBlocker(context: context);
    uiBlocker.blockUI();
    var result = await _manageItemDao.deleteItem(item.id);
    if (result != null) {
      AlertUtils.showSuccess(
          context: context, message: "Successfully item deleted.");
      uiBlocker.blockUI();
      getAllItems();
    } else {
      AlertUtils.showError(context: context, message: "Can not delete item");
      uiBlocker.blockUI();
    }
  }

  void setValues({required ItemDTO item}) {
    itemForUpdate = item;
    itemDiscription.text = item.itemName;
    itemPrice.text = "${item.itemPrice}";
    itemQty.text = "${item.aviableQty}";
    notifyListeners();
  }

  itemFilter() {
    listOfItems = originalList;
    var list = listOfItems
        .where(
          (x) => x.itemName.toLowerCase().contains(
                searchFields.text.toLowerCase(),
              ),
        )
        .toList();
    listOfItems = list;
    notifyListeners();
  }

  void clearFields() {
    this.itemDiscription.text = '';
    this.itemPrice.text = '';
    this.itemQty.text = '';
    countAllItems();
    notifyListeners();
  }

  //  Delete Item  confirm--->>>

  deleteConfirm({
    required BuildContext context,
    required ItemDTO item,
  }) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Confirm",
      desc: "Do you want to delete this item?",
      buttons: [
        DialogButton(
          color: Colors.red,
          child: const Text(
            "Confirm",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            deleteItem(context: context, item: item);
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

  int countItems = 0;
  countAllItems() async {
    countItems = await _manageItemDao.countAllItems();
    notifyListeners();
  }
}
