import 'package:my_cart/helpers/libraries.dart';
import 'package:my_cart/screens/home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .1,
              ),
              'logo.png'.assetImage(height: 120),
              SizedBox(
                height: Get.height * .1,
              ),
              EditText(
                hintText: 'Email',
              ),
              12.height,
              EditText(
                hintText: 'Password',
              ),
              TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?'))
                  .alignTopLeft,
              40.height,
              Button(
                title: 'Log In',
                onPressed: () {
                  Get.to(Home());
                },
              ),
              SizedBox(
                height: Get.height * .1,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      height: 4,
                    ),
                  ),
                  Text('OR'),
                  Expanded(
                    child: Divider(
                      height: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .1,
              ),
              Button(
                title: 'Create An Account',
                color: Colors.grey.shade100,
                textColor: Colors.green,
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
