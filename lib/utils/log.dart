import 'package:flutter/foundation.dart';

const kLOG_TAG = "[Famble]";
void log(dynamic data) {
  if (kDebugMode)
    print("[${DateTime.now().toUtc()}]$kLOG_TAG${data.toString()}");
}
