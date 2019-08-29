import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crud_flutter_dio_bloc/cart_app/cart_bloc.dart';
import 'package:crud_flutter_dio_bloc/create_app/create_bloc.dart';
import 'package:crud_flutter_dio_bloc/home_app/home_bloc.dart';
import 'package:crud_flutter_dio_bloc/shared/repositories/shared/models/Product.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  var bloc = BlocProvider.getBloc<CreateBloc>();

  var blocList = BlocProvider.getBloc<HomeBloc>();

  var cartBloc = BlocProvider.getBloc<CartBloc>();

  var formKey = GlobalKey<FormState>();
  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"),
        leading: StreamBuilder<List<Product>>(
          stream: cartBloc.cartOut,
          builder: (context, snapshot) {
            return Text("${snapshot.data.length}", style: TextStyle(fontSize: 20),);
          }
      ),),
      body: StreamBuilder<int>(
        stream: bloc.responseOut,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text("${snapshot.error}",style: TextStyle(fontSize: 25)));

          if (snapshot.hasData) {
            if (snapshot.data == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else{
              Timer(Duration(seconds: 1), (){
                Navigator.pop(context);
              });
              return Center(child: Text("Inserido com sucesso!",style: TextStyle(fontSize: 25),));
            }
          }else {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nomeProdutoController,
                      decoration: InputDecoration(
                          labelText: "Produto"
                      ),
                      validator: (value) => value.isEmpty ? "o produto nao pode ser vazio" : null,
                    ),
                    TextFormField(
                      controller: precoController,
                      decoration: InputDecoration(
                          labelText: "Preço"
                      ),
                      validator: (value) => value.isEmpty ? "o preço nao pode ser vazio" : null,
                    ),
                    RaisedButton(
                      child: Text("Cadsatrar"),
                      color: Colors.deepPurple,
                      onPressed: () {
                        if(formKey.currentState.validate()){
                          bloc.productIn.add(Product(
                              nameProduct: "${nomeProdutoController.text}",
                              price: "${precoController.text}",
                              category: "Frutas",
                              thumbnail: "teste"));
                          nomeProdutoController.text = null;
                          precoController.text = null;

                        }

                      },
                    ),
                    Divider(height: 20,color: Colors.black,),
                    Container(
                      height: 400,
                      child: StreamBuilder<List<Product>>(
                        //stream: bloc.listOut,
                        stream: cartBloc.cartOut,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          List<Product> products = snapshot.data;
                          return ListView.separated(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(products[index].nameProduct),
                                onTap: ()=> cartBloc.removeCarrinho(products[index]),
                                selected: products[index].isSelected ? true : false,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      ),
    );
  }
}

class Controller {
  var formKey = GlobalKey<FormState>();

  bool validate() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}
