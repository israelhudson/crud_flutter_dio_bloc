import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/general_api.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {

  final GeneralApi api;

  HomeBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);

  Sink get listIn => _listController.sink;

  Observable<List<Post>> get listOut =>
      _listController.stream.asyncMap((v)=>api.getPost());

  @override
  void dispose() {
    _listController.close();
  }

//  @override
//  void addListener(listener) {
//    // TODO: implement addListener
//  }
//
//  @override
//  // TODO: implement hasListeners
//  bool get hasListeners => null;
//
//  @override
//  void notifyListeners() {
//    // TODO: implement notifyListeners
//  }
//
//  @override
//  void removeListener(listener) {
//    // TODO: implement removeListener
//  }
}