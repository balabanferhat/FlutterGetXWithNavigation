import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';

class HomeController extends GetxController {

  var isLoggedIn=true.obs;

  @override
  void onInit()  {

    print("On init HomeController");
    
    bool isLoggedInVal=GetStorage().read<bool>('isLoggedIn');

    ever(isLoggedIn, loginControl);
    if  (isLoggedInVal.isNull) isLoggedInVal=false;
    isLoggedIn.value=isLoggedInVal;

    super.onInit();
  }


  loginControl(loggedIn) {
    if  (!loggedIn) {
      print ("not logged in go to login page");
      //Get.offAllNamed(Routes.LOGIN);
      Get.toNamed(Routes.LOGIN);
    }
  }

}
