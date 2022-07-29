import 'package:my_cart/helpers/libraries.dart';

extension StringExt on String {
  Widget assetImage({double? height, double? width}) => Image.asset(
        'assets/${this}',
        height: height,
        width: width,
      );
}
