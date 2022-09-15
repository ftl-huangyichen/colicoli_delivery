import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/base/base_view.dart';
import '../controllers/main_controller.dart';

class MainPage extends BaseView<MainController> {
  MainPage() {
    controller.getToken();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Obx(() {
            return Text(controller.token);
          }),
        ),
        TextButton(onPressed: () {
          controller.logout();
        }, child: Text("logout"))
      ],
    );
  }
}
