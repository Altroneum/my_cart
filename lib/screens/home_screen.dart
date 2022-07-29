import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_cart/database/daos/product_dao.dart';
import 'package:my_cart/helpers/controllers/db_ctrl.dart';
import 'package:my_cart/helpers/libraries.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/screens/cart.dart';
import 'package:my_cart/screens/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> data = [
    Product(
        id: 1,
        image: 'bottol1.png',
        name: 'Wooden bottol 450ml',
        quantity: 0,
        price: 650,
        isWishList: true),
    Product(
        id: 2,
        image: 'bottol2.png',
        name: 'Wooden stylish bottol 450ml',
        quantity: 0,
        price: 840,
        isWishList: false),
    Product(
        id: 3,
        image: 'bottol3.png',
        name: 'Wooden german bottol 950ml',
        quantity: 0,
        price: 986,
        isWishList: false),
    Product(
        id: 4,
        image: 'bottol4.png',
        name: 'Wooden bottol 250ml',
        quantity: 0,
        price: 999,
        isWishList: true),
    Product(
        id: 5,
        image: 'bottol1.png',
        name: 'Wooden bottol 500ml',
        quantity: 0,
        price: 1250,
        isWishList: false)
  ];

  @override
  void initState() {
    getDatabase();
    super.initState();
  }

  ProductDao productDao = Get.find<DbCtrl>().productDao;
  getDatabase() async {
    List<Product> cartData = await productDao.getAllProducts();
    cart.value = cartData.length;
  }

  var cart = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(fontSize: 18),
            ),
            InkWell(
              onTap: () {
                Get.to(Cart())?.then((value) {
                  getDatabase();
                });
              },
              child: Column(
                children: [
                  Obx(() => Text(cart.value.toString())),
                  const Icon(Icons.shopping_cart),
                ],
              ),
            )
          ],
        ),
        12.height,
        const Text(
          'Suneel Kumar,',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        40.height,
        EditText(
          hintText: 'Search ',
        ),
        20.height,
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 2.7),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(18)),
                        child: Icon(
                          Icons.favorite,
                          size: 24,
                          color: data[index].isWishList
                              ? Colors.pink
                              : Colors.grey,
                        ),
                      ).alignTopRight,
                      Column(
                        children: [
                          data[index].image.assetImage(height: 120).onTap(
                              onTap: () {
                            Get.to(ProductDetails(product: data[index]));
                          }),
                          16.height,
                          Text(
                            '${data[index].name} \n\u20b9 ${data[index].price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                          8.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                itemSize: 14,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              InkWell(
                                onTap: () {
                                  Product product = data[index];
                                  product.quantity = product.quantity + 1;
                                  data[index] = product;
                                  print(product.quantity);
                                  productDao.insertProduct(product);
                                  cart.value = cart.value + 1;
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200),
                                  child: const Icon(Icons.add),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
