import 'package:get/get.dart';
import 'package:get_x_with_nav/services/login_api.dart';

class RehberController extends GetxController {
  var personelList = [].obs;
  var isLoading = false.obs;

  onInit() async {
    await getPersonelListesi();
    super.onInit();
  }

  getPersonelListesi() async {
    var list = [];
    isLoading.value = true;
    list = await LoginAPI().personelListesi();
    personelList.value = list;
    isLoading.value = false;
  }
}
