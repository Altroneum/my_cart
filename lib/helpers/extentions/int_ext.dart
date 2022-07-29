import 'dart:ffi';

import 'package:my_cart/helpers/libraries.dart';

extension IntExt on int {
  Widget get height => SizedBox(
        height: toDouble(),
      );
  Widget get width => SizedBox(
        width: toDouble(),
      );
}
