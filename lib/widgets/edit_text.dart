import 'package:my_cart/helpers/libraries.dart';

class EditText extends StatelessWidget {
  String hintText;
  EditText({Key? key, this.hintText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 24, top: 16, bottom: 16),
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none)),
    );
  }
}
