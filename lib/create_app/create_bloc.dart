import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/create_app/create_repository.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/general_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class CreateBloc extends BlocBase{
  final CreateHepository repo;

  CreateBloc(this.repo){
    responseOut = product.switchMap(observableCreate);
  }

  Product productd;

  var product = BehaviorSubject<Product>();

  Product get productValue => product.value;
  Observable<int> responseOut;
  Sink<Product> get productIn => product.sink;

  Stream<int> observableCreate(Product data) async* {
    yield 0;
    try{
      var response = await repo.createProduct(data.toJson());
      yield response;
    }catch(e){
      throw e;
    }
  }

  @override
  void dispose() {
    product.close();
    super.dispose();
  }

}