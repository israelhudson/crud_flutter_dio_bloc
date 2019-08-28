
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/custom_dio.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreateHepository{

  final Dio dio;

  CreateHepository(this.dio);

  Future<int> createProduct(Map<String, dynamic> data) async {
    try {
      var response = await dio.post("/product", data: data);

      debugPrint("NS SUCESSO ${response.statusCode}");

      return response.statusCode;
    } on DioError catch (e) {
      debugPrint("NS ${e.message}");
    }
  }
}