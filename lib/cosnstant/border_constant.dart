import 'package:flutter/painting.dart';

class BorderConstants {
  static BorderConstants instance = BorderConstants._init();
  BorderConstants._init();

  final border1 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
}
