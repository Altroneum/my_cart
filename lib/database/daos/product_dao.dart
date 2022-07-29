import 'package:floor/floor.dart';
import 'package:my_cart/models/product_model.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM product')
  Future<List<Product>> getAllProducts();

  @insert
  Future<void> insertProduct(Product product);

  @delete
  Future<void> deleteProduct(Product product);
}
