import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase{

  final controlador = BehaviorSubject<int>.seeded(0);

  Observable<int> get saida => controlador.stream;

  Sink<int> get entrada => controlador.sink;

  int get valor => controlador.value;

  addCart(){
    entrada.add(valor +1);
  }

  @override
  void dispose() {
    controlador.close();
    super.dispose();
  }

}