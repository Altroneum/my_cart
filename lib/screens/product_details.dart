import 'package:my_cart/helpers/libraries.dart';
import 'package:my_cart/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [product.image.assetImage(height: 200).alignBottomCenter],
      ),
    );
  }
}
