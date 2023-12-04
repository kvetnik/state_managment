import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'cart_screen.dart';

class ProductsApp extends StatelessWidget{
  const ProductsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
              primarySwatch: Colors.blue,
          ),
          home: StoreProvider(
            store: Store(reducer, initialState: GetIt.I.get<AppState>()),
            child: const Home(),
          ),
      );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(InitializeEvent());

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SimpleStateApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<CartScreen>(
                          builder: (_) =>
                              StoreProvider(
                                store: StoreProvider.of<AppState>(context),
                                child: const CartScreen(),
                              ),
                            //   Provider.value(
                            // value: StoreProvider.of<AppState>(context),
                            // child: const CartScreen(),
                          // )
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart)
              ),
              Center(
                child: Padding(child: Text(snapshot.cart.length.toString()),padding: const EdgeInsets.only(right: 10),),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: snapshot.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.products.elementAt(index).name),
                trailing: snapshot.cart.contains(snapshot.products.elementAt(index))
                    ? IconButton(
                  onPressed: () {
                    store.dispatch(RemoveFromCartEvent(snapshot.products.elementAt(index)));
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green,),
                )
                    : IconButton(
                  onPressed: () {
                    store.dispatch(AddToCartEvent(snapshot.products.elementAt(index)));
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              );
            },
          ),
        );
      },
    );
  }
}



