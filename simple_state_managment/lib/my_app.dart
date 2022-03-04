import 'package:business/business.dart';
import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_managment/cart_screen.dart';

class ProductsProviderApp extends StatelessWidget{
  ProductsProviderApp({Key? key}) : super(key: key);

  final ProductsAppState _productsAppState = GetIt.I.get<ProductsAppState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductsAppState>(
      create: (_) => _productsAppState,
      child: MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
              primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsAppState>(builder: (context, state, child) {
      if (!state.isLoaded) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
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
                child: Padding(child: Text(state.cart.length.toString()),padding: const EdgeInsets.only(right: 10),),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.products.elementAt(index).name),
                trailing: state.cart.contains(state.products.elementAt(index))
                    ? IconButton(
                        onPressed: () {
                          state.cart.remove(state.products.elementAt(index));
                          state.notifyListeners();
                        },
                        icon: const Icon(Icons.add_circle_outline, color: Colors.green,),
                      )
                    : IconButton(
                        onPressed: () {
                          state.cart.add(state.products.elementAt(index));
                          state.notifyListeners();
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
              );
            },
          ),
        );
      }
    });
  }

}