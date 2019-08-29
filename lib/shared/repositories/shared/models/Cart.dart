import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';

class Cart {

  final _cartList = <Product>{};

  Set<Product> get products => _cartList;

  void addCart(Product post) => _cartList.add(post);

  void deleteCart(Product post) => _cartList.remove(post);
}