import 'package:floor/floor.dart';

@Entity(tableName: 'product')
class Product {
  @PrimaryKey(autoGenerate: false)
  int id;
  String image, name;
  int quantity;
  double price;
  bool isWishList;
  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.isWishList});
}
