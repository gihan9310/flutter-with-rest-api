import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/providers/item_add_provider.dart';
import 'package:curd_app/providers/order_manage_provider.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:curd_app/utils/system_path_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddOrderItems extends StatefulWidget {
  const AddOrderItems({Key? key}) : super(key: key);

  @override
  State<AddOrderItems> createState() => _AddOrderItemsState();
}

class _AddOrderItemsState extends State<AddOrderItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderManageProvider provider =
        Provider.of<OrderManageProvider>(context, listen: false);
    provider.getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    OrderManageProvider provider =
        Provider.of<OrderManageProvider>(context, listen: true);
    return Container(
      decoration: mainBox,
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.listOfItems.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(5),
            height: 80,
            width: 300,
            decoration: gradian,
            child: Stack(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Positioned(
                  top: 2,
                  left: 4,
                  child: CustomLable(
                    title: "Item Code : ${provider.listOfItems[i].itemCode}",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 4,
                  child: CustomLable(
                    title: "Discription: ${provider.listOfItems[i].itemName}",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 4,
                  child: CustomLable(
                    title: "Price : ${provider.listOfItems[i].itemPrice}",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 100,
                  child: CustomLable(
                    title: "Av Qty : ${provider.listOfItems[i].aviableQty}",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 10,
                  child: AddButton(
                    icon: "add.svg",
                    onTap: () {
                      provider.addItems(
                          index: i, addYes: true, context: context);
                    },
                  ),
                ),
                // ignore: prefer_const_constructors
                Positioned(
                  top: 2,
                  right: 100,
                  // ignore: prefer_const_constructors
                  child: AddButton(
                    icon: "substract.svg",
                    onTap: () {
                      provider.addItems(
                          index: i, addYes: false, context: context);
                    },
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 50,
                  // ignore: prefer_const_constructors
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 30,
                    decoration: rountButton,
                    child: CustomLable(
                      title: " ${provider.listOfItems[i].addItemForSale}",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (!provider.listOfItems[i].isSelected)
                  Positioned(
                    bottom: 1,
                    right: 10,
                    // ignore: prefer_const_constructors
                    child: AddButton(
                      icon: "ok3.svg",
                      onTap: () {
                        provider.addToOrder(
                            index: i, addToOrder: true, context: context);
                      },
                    ),
                  ),
                if (provider.listOfItems[i].isSelected)
                  Positioned(
                    bottom: 1,
                    right: 10,
                    // ignore: prefer_const_constructors
                    child: AddButton(
                      icon: "cancel.svg",
                      onTap: () {
                        provider.addToOrder(
                            index: i, addToOrder: false, context: context);
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: rountButton2,
        child: SvgPicture.asset(
          ICON_PATH + icon,
          color: Colors.white,
          height: 5,
          width: 10,
        ),
      ),
    );
  }
}
