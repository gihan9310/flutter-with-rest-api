import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/common/selected_options.dart';
import 'package:curd_app/providers/home_provider.dart';
import 'package:curd_app/providers/item_add_provider.dart';
import 'package:curd_app/providers/order_manage_provider.dart';
import 'package:curd_app/screens/options/add_items_page.dart';
import 'package:curd_app/screens/options/manage_orders.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:curd_app/utils/navigation_utils.dart';
import 'package:curd_app/utils/system_path_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ManageItemProvider itemProvider =
        Provider.of<ManageItemProvider>(context, listen: false);

    OrderManageProvider orderProvider =
        Provider.of<OrderManageProvider>(context, listen: false);
    orderProvider.countAllItems();
    itemProvider.countAllItems();
  }

  List<_ChartData> data = [
    _ChartData('CHN', 12),
    _ChartData('GER', 15),
    _ChartData('RUS', 30),
    _ChartData('BRZ', 6.4),
    _ChartData('IND', 14)
  ];

  late TooltipBehavior _tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ManageItemProvider itemProvider =
        Provider.of<ManageItemProvider>(context, listen: true);
    OrderManageProvider orderProvider =
        Provider.of<OrderManageProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          width: size.width,
          decoration: mainBox,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CustomLable(
                title: 'Curd Example With Spring Boot/Flutter',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 180,
                    height: 200,
                    decoration: gradian,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomLable(
                          title: "Number of Items",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomLable(
                          title: "${itemProvider.countItems}",
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 200,
                    decoration: gradian,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomLable(
                          title: "Number of Orders",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomLable(
                          title: "${orderProvider.orderCount}",
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                height: 200,
                decoration: gradian,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: _tooltip,
                  
                  series: <ChartSeries<_ChartData, String>>[
                    BarSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Black',
                      color: Colors.green,
                      
                      dataLabelSettings:DataLabelSettings(isVisible: true) 
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: size.width,
                height: 150,
                decoration: gradian,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SelectOption(
                      icons: "addItems.svg",
                      title: 'Add Item',
                      onTap: () {
                        NavigatorUtils.goTo(context: context, page: AddItems());
                      },
                    ),
                    SelectOption(
                      icons: "online-sales.svg",
                      title: 'Sales',
                      onTap: () {
                        NavigatorUtils.goTo(
                            context: context, page: OrderManagementPage());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
