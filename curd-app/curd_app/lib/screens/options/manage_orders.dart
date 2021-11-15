import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/common/custom_dropdown.dart';
import 'package:curd_app/dtos/items_dto.dart';
import 'package:curd_app/providers/item_add_provider.dart';
import 'package:curd_app/providers/order_manage_provider.dart';
import 'package:curd_app/screens/options/widgets/get_order_items.dart';
import 'package:curd_app/screens/options/widgets/place_order.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:curd_app/utils/system_path_utils.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OrderManagementPage extends StatelessWidget {
  OrderManagementPage({Key? key}) : super(key: key);

  DropdownEditingController businessType = DropdownEditingController(value: '');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    OrderManageProvider provider =
        Provider.of<OrderManageProvider>(context, listen: true);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: AppBarBackGround(),
            title: const CustomLable(
              title: "Manage Orders",
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              onTap: (index) {},
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    ICON_PATH + 'orderItems.svg',
                    height: 30,
                    color: Colors.white,
                  ),
                  text: 'Add Items',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    ICON_PATH + 'order-svgrepo-com.svg',
                    height: 30,
                    color: Colors.white,
                  ),
                  text: 'Place Order',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AddOrderItems(),
              PlaseOrder(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarBackGround extends StatelessWidget {
  const AppBarBackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffB1097C),
            Color(0xff0947B1),
          ],
        ),
      ),
    );
  }
}
