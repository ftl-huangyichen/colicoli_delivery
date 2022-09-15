import 'package:colicoli_delivery/core/base/base_view.dart';
import 'package:colicoli_delivery/core/values/app_colors.dart';
import 'package:colicoli_delivery/core/values/app_values.dart';
import 'package:colicoli_delivery/core/widget/custom_input_field.dart';
import 'package:flutter/material.dart';

import '../controllers/login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage() {
    controller.getToken();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.extraLargePadding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InputField(
              headerText: 'username', hintTexti: 'please input username'),
          const SizedBox(
            height: AppValues.height_16,
          ),
          InputField(
              headerText: 'password', hintTexti: 'please input password'),
          const SizedBox(
            height: AppValues.height_16,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.all(AppValues.buttonVerticalPadding),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              onPressed: _onTap,
              child: const Text('login',
                  style: TextStyle(color: AppColors.colorWhite)),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap() {
    controller.login("huangyichen", "Ftl123456");
  }
}
