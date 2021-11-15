import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/dtos/items_dto.dart';
import 'package:curd_app/providers/item_add_provider.dart';
import 'package:curd_app/screens/options/widgets/save_items.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class ItemAddCard extends StatelessWidget {
  const ItemAddCard({
    Key? key,
    required this.size,
    required this.item,
    required this.provider,
    required this.rxContext,
  }) : super(key: key);

  final Size size;
  final ItemDTO item;
  final ManageItemProvider provider;
  final BuildContext rxContext;
  // final

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: gradian2,
      width: size.width,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            left: 2,
            child: CustomLable(title: "Item Code : ${item.itemCode}"),
          ),
          Positioned(
            top: 30,
            left: 2,
            child: CustomLable(title: "Description : ${item.itemName}"),
          ),
          Positioned(
            top: 60,
            left: 2,
            child: CustomLable(title: "Price : ${item.itemPrice}"),
          ),
          Positioned(
            top: 90,
            left: 2,
            child: CustomLable(title: "Av Quantity : ${item.aviableQty}"),
          ),
          // ignore: prefer_const_constructors
          Positioned(
            right: 5,
            bottom: 1,
            child: CustomRoundedButton(
              icon: Icons.delete,
              onTap: () {
                provider.deleteConfirm(item: item, context: rxContext);
              },
            ),
          ),

          Positioned(
            right: 5,
            top: 1,
            child: CustomRoundedButton(
              icon: Icons.edit,
              onTap: () {
                provider.setValues(item: item);
                ManageItemRelatedTasks()
                    .showSaveItemBox(context: context, provider: provider, buttonText: "Update");
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: rountButton,
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
