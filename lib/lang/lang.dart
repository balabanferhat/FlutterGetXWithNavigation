import 'package:get/get.dart';
import 'package:get_x_with_nav/lang/en.dart';
import 'package:get_x_with_nav/lang/tr.dart';

class Lang extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': turkish(),
        'en_US': english(),
      };
}
