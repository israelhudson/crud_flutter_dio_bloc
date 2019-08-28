import 'package:crud_flutter_dio_bloc/shared/repositories/constants.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:dio/dio.dart';

class GeneralApi {

  //instancia do Dio
  final Dio dio;

  //Construtor do repositorio
  GeneralApi(this.dio);

  //metodo para pegar os posts da aplicação
  Future<List<Post>> getPost() async {
    Response response = await dio.get("/posts");
    return (response.data as List).map((post)=> Post.fromJson(post)).toList();
  }

}