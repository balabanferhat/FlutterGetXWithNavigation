import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/generated/models/personel.dart';
import 'package:get_x_with_nav/services/login_api.dart';
import 'package:get_x_with_nav/utils/log.dart';

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

    List? storedTodos = GetStorage().read<List>('todos');

    if (storedTodos != null) {
      log("get from storage");
      personelList.value =
          storedTodos.map((e) => Personel.fromJson(e)).toList();
    } else {
      log("get from APİ");
      list = await LoginAPI().personelListesi();

      GetStorage().write('todos', list.toList());

      personelList.value = list;
    }

    isLoading.value = false;
  }

  getPersonelListeUpdate() async {
    GetStorage().erase();
    isLoading.value = true;
    var list = [];
    log("get from UPDATE");
    list = await LoginAPI().personelListesi();
    GetStorage().write('todos', list.toList());
    personelList.value = list;
    personelList.sort((a, b) {
      return a.adi.toLowerCase().compareTo(b.soyadi.toLowerCase());
    });
    isLoading.value = false;
  }

  getPersonelListeLowerCase() async {
    isLoading.value = true;
    personelList.sort((a, b) {
      return a.adi.toLowerCase().compareTo(b.adi.toLowerCase());
    });
    isLoading.value = false;
  }
}
