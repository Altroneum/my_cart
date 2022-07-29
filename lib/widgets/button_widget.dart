import 'package:my_cart/helpers/libraries.dart';

class Button extends StatelessWidget {
  final double width, height;
  final String title;
  final Color color, textColor;
  VoidCallback? onPressed;

  Button(
      {Key? key,
      this.width = double.infinity,
      this.height = 48,
      this.title = '',
      this.color = Colors.green,
      this.textColor = Colors.white,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(textColor),
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
          child: Text(title),
        ));
  }
}
