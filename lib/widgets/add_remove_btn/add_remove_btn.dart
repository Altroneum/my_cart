import 'package:my_cart/helpers/libraries.dart';

class AddRemoveBtn extends StatelessWidget {
  AddRemoveBtn(
      {Key? key,
      this.text = '',
      this.color = Colors.white,
      this.textColor = Colors.black})
      : super(key: key);
  String text;
  Color color, textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 18, color: textColor),
      )),
    );
  }
}
