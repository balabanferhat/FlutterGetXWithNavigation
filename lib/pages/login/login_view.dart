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
  bool rememberMe = false;
  final LoginController loginController = Get.put(LoginController());

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");

  loginUser() async {
    //String username, String password

    //Get.toNamed(Routes.LOGIN);
    String username = usernameController.text;
    String password = passController.text;
    loginController.loginUser(username, password);
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
                      formHeading("Login/"),
                      formSubHeadingForm("Signup")
                    ]),
                SizedBox(height: 50),
                editTextStyle("Username", usernameController,
                    isPassword: false),
                SizedBox(height: 16),
                editTextStyle("Password", passController, isPassword: true),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: CheckboxListTile(
                    title: text("Remember me", textColor: textColorPrimary),
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
                    child: shadowButton("Sign in", this.loginUser)),
                SizedBox(height: 24),
                text("forgot pass",
                    textColor: textColorPrimary, fontFamily: fontMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
