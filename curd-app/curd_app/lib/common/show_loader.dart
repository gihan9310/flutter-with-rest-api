import 'package:curd_app/common/custom_loader.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_loader_overlay/progress_loader_overlay.dart';

class ShowUiBlocker {
  BuildContext context;
  ShowUiBlocker({required this.context}) {
    ProgressLoader().widgetBuilder = (context, _) => const OverfllowUI();
  }

  void blockUI() async {
    await ProgressLoader().show(context);
  }

  void unBlockUI() async {
    await ProgressLoader().dismiss();
  }
}
