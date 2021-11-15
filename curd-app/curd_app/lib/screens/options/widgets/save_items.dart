// ignore_for_file: prefer_const_constructors

import 'package:curd_app/providers/item_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ManageItemRelatedTasks {
  showSaveItemBox({
    required BuildContext context,
    required ManageItemProvider provider,
    required String buttonText,
  }) {
    if(buttonText!='Update'){
      provider.clearFields();
    }
    Alert(
      context: context,
      title: buttonText == 'Update' ? 'Update Item' : 'Add Item',
      content: Column(
        children: <Widget>[
          TextField(
            controller: provider.itemDiscription,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              icon: Icon(Icons.text_fields),
              labelText: 'Description',
            ),
          ),
          TextField(
            controller: provider.itemPrice,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.price_check),
              labelText: 'Price',
            ),
          ),
          TextField(
            controller: provider.itemQty,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.production_quantity_limits),
              labelText: 'AviableQty',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => buttonText == 'Update'
              ? provider.updateItem(
                  context: context,
                )
              : provider.saveItem(context: context),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          color: Colors.orange,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Clear",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
