import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Cart.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase{

  final _cart = Cart();

  final _listController = BehaviorSubject.seeded(List<Product>());

  Observable<List<Product>> get cartOut => _listController.stream;

  Sink<List<Product>> get cartIn => _listController.sink;

  adicionaCarrinho(Product product){
    product.isSelected = true;
    _cart.addCart(product);
    updateList();
  }

  removeCarrinho(Product product){
    _cart.deleteCart(product);
    updateList();
  }

  void updateList() {
    cartIn.add(_cart.products.toList());
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }

}