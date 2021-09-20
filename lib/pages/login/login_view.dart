import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/pages/login/login_controller.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';
import 'package:get_x_with_nav/services/login_api.dart';
import 'package:get_x_with_nav/utils/colors.dart';
import 'package:get_x_with_nav/utils/constants.dart';
import 'package:get_x_with_nav/utils/images.dart';
import 'package:get_x_with_nav/utils/widgets.dart';

class LoginView extends StatelessWidget {
  bool? rememberMe = false;
  final LoginController loginController = Get.put(LoginController());

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");

  loginUser() async {
    //String username, String password

    //Get.toNamed(Routes.LOGIN);
    String username = usernameController.text;
    String password = passController.text;

    if (username.length < 3) {
      Get.snackbar("warning".tr, "enter_username".tr);
    } else if (password.length < 3) {
      Get.snackbar("warning".tr, "enter_pass".tr);
    } else {
      loginController.loginUser(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Image.asset(t1_ic_ring, height: 100, width: 100),
                SizedBox(height: 16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading("login".tr + "/"),
                      formSubHeadingForm("signup".tr)
                    ]),
                SizedBox(height: 50),
                new Form(
                    //autovalidate: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        editTextStyle("username".tr, usernameController,
                            isPassword: false),
                        SizedBox(height: 16),
                        editTextStyle("password".tr, passController,
                            isPassword: true),
                      ],
                    )),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: CheckboxListTile(
                    title: text("remember_me".tr, textColor: textColorPrimary),
                    value: rememberMe,
                    onChanged: (newValue) {
                      rememberMe = newValue;
                      //setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                    padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                    child: shadowButton("login".tr, this.loginUser)),
                SizedBox(height: 24),
                text("forgot_pass".tr,
                    textColor: textColorPrimary, fontFamily: fontMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
