import 'package:flutter/foundation.dart';

const kLOG_TAG = "[Getx]";
void log(dynamic data) {
  if (kDebugMode)
    print("[${DateTime.now().toUtc()}]$kLOG_TAG${data.toString()}");
}
