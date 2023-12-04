import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class ProductsApp extends StatelessWidget{
  ProductsApp({Key? key}) : super(key: key);

  final AppState _productsAppState = GetIt.I.get<AppState>();

  @override
  Widget build(BuildContext context) {
    return Provider<AppState>(
      create: (_) => _productsAppState,
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Observer(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('SimpleStateApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: const Icon(Icons.shopping_cart)
              ),
              Center(
                child: Padding(
                  child: Text(state.cart.length.toString()),
                  padding: const EdgeInsets.only(right: 10),),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              return  ListTile(
                title: Text(state.products.elementAt(index).name),
                trailing: state.cart.contains(state.products.elementAt(index))
                    ? IconButton(
                  onPressed: () {
                    state.removeProduct(state.products.elementAt(index));
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green,),
                )
                    : IconButton(
                  onPressed: () {
                    state.addProduct(state.products.elementAt(index));
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              );
            },
          ),
        )
    );
  }
}



