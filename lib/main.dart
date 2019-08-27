import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/home_app/home_page.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/general_api.dart';
import 'package:crud_flutter_dio_bloc/ui/home_page.dart';
import 'package:flutter/material.dart';

import 'shared/repositories/shared/repositories/custom_dio.dart';

void main(){
//  MaterialPageRoute.debugEnableFadingRoutes =
//  true;

  var app = MaterialApp(
    //home: Home(),
    home: HomePage(),
  );

  runApp(BlocProvider(
    child: app,
    dependencies: [
      Dependency((i) => CustomDio(), singleton: true),
      Dependency((i) => GeneralApi(i.get<CustomDio>().getClient())),
    ],
    blocs: [
      Bloc((i) => HomeBloc(i.get<GeneralApi>())),
    ],
  ));
}