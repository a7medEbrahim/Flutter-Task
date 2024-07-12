import 'package:flutter/foundation.dart';

class Utility {
  static myPrintX(object) async {
    if (!kReleaseMode) print(object);
  }
}
