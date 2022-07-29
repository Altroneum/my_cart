import 'package:my_cart/helpers/libraries.dart';
import 'package:my_cart/screens/home_screen.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: HomeScreen(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (index) {},
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home")
          ]),
    );
  }
}
