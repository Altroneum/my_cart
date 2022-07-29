import 'package:my_cart/helpers/libraries.dart';

extension WidgetExt on Widget {
  Widget get alignTopLeft => Align(
        alignment: Alignment.topLeft,
        child: this,
      );
  Widget get alignTopRight => Align(
        alignment: Alignment.topRight,
        child: this,
      );
  Widget get alignBottomCenter => Align(
        alignment: Alignment.bottomCenter,
        child: this,
      );
  Widget onTap({GestureTapCallback? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );
}
