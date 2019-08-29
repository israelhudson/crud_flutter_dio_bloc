import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/general_api.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {

  final GeneralApi api;

  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(List<Product>());

  Sink get listIn => _listController.sink;

  Observable<List<Post>> get listOut => _listController.stream.asyncMap((v)=>api.getPost());

  Observable<List<Product>> get listOutProducts => _listController.stream.asyncMap((v)=>api.getProducts());

  List<Product> get listaSalvaProdutos => _listController.value;

  @override
  void dispose() {
    _listController.close();
  }

}