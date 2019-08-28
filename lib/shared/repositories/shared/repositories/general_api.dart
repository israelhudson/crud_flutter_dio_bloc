import 'package:crud_flutter_dio_bloc/shared/repositories/constants.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
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

  Future<List<Product>> getProducts() async {
    Response response = await dio.get("/product");
    return (response.data as List).map((product)=> Product.fromJson(product)).toList();
  }

  Future<List<Product>> saveProduct(Product product) async {
    Response response = await dio.post("/product",
        data: {
          "id": product.nameProduct.length * 3,
          "nameProduct": "${product.nameProduct}",
          "price": "${product.price}",
          "category": "Frutas",
          "thumbnail": "teste",
          "isSelected": "false"
        });
    return (response.data);
  }

//  Future<int> createPost(Map<String, dynamic> data) async {
//    try {
//      var response = await _client.post("/posts", data: data);
//      return response.statusCode;
//    } on DioError catch (e) {
//      throw (e.message);
//    }
//  }

}