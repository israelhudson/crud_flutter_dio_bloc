import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/repositories/general_api.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.getBloc<HomeBloc>();

    return Scaffold(
      appBar: AppBar(title: Text("Inject"),),
      body: StreamBuilder<List<Post>>(
        stream: bloc.listOut,
        builder: (context, snapshot){
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
          List<Post> posts = snapshot.data;
          return ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index){
              return ListTile(title: Text(posts[index].title),);
            },
            separatorBuilder: (context, index){
              return Divider();
              },
          );
        },
      ),
    );
  }
}
