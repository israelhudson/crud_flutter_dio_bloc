import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/cart_app/cart_bloc.dart';
import 'package:crud_flutter_dio_bloc/create_app/create_page.dart';
import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bloc = BlocProvider.getBloc<HomeBloc>();
  final cartBloc = BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Inject"),
        leading: StreamBuilder<List<Product>>(
          stream: cartBloc.cartOut,
          builder: (context, snapshot) {
            return Text("${snapshot.data.length}", style: TextStyle(fontSize: 20),);
          }
        ),
      ),
      body: StreamBuilder<List<Product>>(
        //stream: bloc.listOut,
        stream: bloc.listOutProducts,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          List<Product> product = snapshot.data;

          return ListView.separated(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  title: Text(product[index].nameProduct,
                  ),
                  //onTap: ()=> cartBloc.addCountCart(),
                  onTap: (){

                    //if (snapshot.data.contains(product[index])) {
                      cartBloc.adicionaCarrinho(product[index]);
                    //}

                    snapshot.data[index].isSelected = !snapshot.data[index].isSelected;

                  },
                  selected: snapshot.data[index].isSelected ? true : false,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(
            builder: (context) => CreatePage())),
        ),
    );
  }
}
