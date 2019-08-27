import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/general_api.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:flutter_test/flutter_test.dart';

main(){

  var bloc = HomeBloc(GeneralApi());

  test("Test if completed list", (){
      bloc.listIn.add(true);

      expect(bloc.listOut, emits(List<Post>()));

  }, skip: true);
}