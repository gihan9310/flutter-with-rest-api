import 'package:curd_app/common/cuatom_lable.dart';
import 'package:curd_app/utils/common_utils.dart';
import 'package:curd_app/utils/system_path_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    required this.icons,
    required this.onTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String icons;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 200,
        decoration: gradian2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ICON_PATH + icons,
              color: Colors.white,
              height: 50,
            ),
            SizedBox(
              height: 10,
            ),
            CustomLable(
              title: title,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
