import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/common/custom_input.dart';
import 'package:curd_app/common/show_loader.dart';
import 'package:curd_app/providers/item_add_provider.dart';
import 'package:curd_app/screens/options/widgets/item_card.dart';
import 'package:curd_app/screens/options/widgets/save_items.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItems extends StatelessWidget {
  AddItems({Key? key}) : super(key: key);

  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ManageItemProvider provider =
        Provider.of<ManageItemProvider>(context, listen: true);

    ShowUiBlocker uiBlocker = ShowUiBlocker(context: context);
    // uiBlocker.blockUI();
    provider.isLoading ? uiBlocker.blockUI() : uiBlocker.unBlockUI();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ManageItemRelatedTasks().showSaveItemBox(
                context: context, provider: provider, buttonText: "Save");
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: mainBox,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: size.width,
                  decoration: gradian,
                  padding: EdgeInsets.all(10),
                  // ignore: prefer_const_constructors
                  child: CustomLable(
                    title: "Manage Items",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width,
                  decoration: gradian,
                  padding: EdgeInsets.all(10),
                  child: CustomInuput(
                    controller: provider.searchFields,
                    icon: Icons.search,
                    hintText: 'Search',
                    onChange: (value) {
                      provider.itemFilter();
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    for (var i = 0; i < provider.listOfItems.length; i++)
                      ItemAddCard(
                        size: size,
                        item: provider.listOfItems[i],
                        rxContext: context,
                        provider: provider,
                      ),
                  ],
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
