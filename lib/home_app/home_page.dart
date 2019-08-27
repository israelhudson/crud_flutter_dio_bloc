import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/general_api.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(GeneralApi());
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
