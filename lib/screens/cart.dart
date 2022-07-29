import 'package:my_cart/database/daos/product_dao.dart';
import 'package:my_cart/helpers/controllers/db_ctrl.dart';
import 'package:my_cart/helpers/libraries.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/widgets/add_remove_btn/add_remove_btn.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  ProductDao productDao = Get.find<DbCtrl>().productDao;
  var isLoading = true.obs;
  @override
  void initState() {
    getData();
    super.initState();
  }

  var data = <Product>[].obs;
  getData() async {
    isLoading.value = true;
    data.value = await productDao.getAllProducts();
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text(
          'My Bag',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Obx(
                () => isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                data[index]
                                    .image
                                    .assetImage(height: 150, width: 150),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 2,
                                      ),
                                      8.height,
                                      Text('\u20b9 ${data[index].price}'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Product product = data[index];
                                              if (product.quantity > 1) {
                                                product.quantity =
                                                    product.quantity - 1;
                                                data[index] = product;
                                                productDao
                                                    .insertProduct(product);
                                              } else {
                                                productDao
                                                    .deleteProduct(data[index]);
                                                data.removeAt(index);
                                              }
                                            },
                                            child: AddRemoveBtn(
                                              text: '-',
                                              color: Colors.red,
                                              textColor: Colors.white,
                                            ),
                                          ),
                                          AddRemoveBtn(
                                            text: '${data[index].quantity}',
                                            color: Colors.white,
                                            textColor: Colors.black,
                                          ),
                                          AddRemoveBtn(
                                            text: '+',
                                            color: Colors.green,
                                            textColor: Colors.white,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
              ),
              12.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Delivery Location'), Text('CHANGE')],
              ),
              12.height,
              Row(
                children: [
                  const Icon(Icons.location_on),
                  24.width,
                  const Expanded(
                      child: Text(
                    ' A-2/1, Balda Colony, New Hyderabad, Nishat Ganj, Lucknow, Uttar Pradesh 226007',
                  ))
                ],
              ),
              40.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Sub Total'), Text('\u20b9 6555')],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Delivery charge'), Text('\u20b9 120')],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Coupon Discount'), Text('\u20b9 120')],
              ),
              const Divider(),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Total'), Text('\u20b9 6555')],
              ),
              24.height,
              Button(
                title: 'Place Order',
              ),
            ],
          )),
    );
  }
}
