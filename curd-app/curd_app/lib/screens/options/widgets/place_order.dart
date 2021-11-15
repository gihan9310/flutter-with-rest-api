import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/common/custom_input.dart';
import 'package:curd_app/providers/order_manage_provider.dart';
import 'package:curd_app/screens/options/widgets/get_order_items.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaseOrder extends StatelessWidget {
  PlaseOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    OrderManageProvider provider =
        Provider.of<OrderManageProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height / 1.3,
        padding: EdgeInsets.all(10),
        decoration: mainBox,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height / 15,
              decoration: rountButton,
              child: CustomLable(
                title: "Added Order Items",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height / 2.1,
              width: size.width,

              // decoration: gradian2,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.orderItemList.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      height: size.height / 10,
                      width: size.width,
                      decoration: gradian,
                      child: Stack(
                        children: [
                          CustomLable(
                            title:
                                "Code : ${provider.orderItemList[i].itemCode}",
                            fontSize: 12,
                          ),
                          Positioned(
                            top: 20,
                            child: CustomLable(
                              title:
                                  "Item Name  : ${provider.orderItemList[i].itemName}",
                              fontSize: 12,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            child: CustomLable(
                              title:
                                  "Price : ${provider.orderItemList[i].itemPrice}",
                              fontSize: 12,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 120,
                            child: CustomLable(
                              title:
                                  "Requet Qty : ${provider.orderItemList[i].addItemForSale}",
                              fontSize: 12,
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 220,
                            child: CustomLable(
                              title:
                                  "Line Total : ${provider.orderItemList[i].addItemForSale * provider.orderItemList[i].itemPrice}",
                              fontSize: 12,
                            ),
                          ),
                          Positioned(
                            top: 2,
                            right: 10,
                            // ignore: prefer_const_constructors
                            child: AddButton(
                              icon: "substract.svg",
                              onTap: () {
                                provider.addToOrder(
                                  index: i,
                                  addToOrder: false,
                                  context: context,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: gradian,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width / 2.4,
                            child: CustomInuput(
                              controller: provider.customerName,
                              onChange: (val) {},
                              hintText: "Customer Name",
                            ),
                          ),
                          Container(
                            width: size.width / 2.4,
                            child: CustomInuput(
                              controller: provider.mobile,
                              hintText: "Mobile",
                              onChange: (val) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: CustomLable(
                        title: "Total : ${provider.total}",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 20,
                      child: ElevatedButton(
                        child: CustomLable(
                          title: "Placed",
                        ),
                        onPressed: () {
                          provider.saveOrderConfirm(context: context);
                        },
                        style: ElevatedButton.styleFrom(),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 120,
                      child: ElevatedButton(
                        child: CustomLable(
                          title: "Cancel",
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
