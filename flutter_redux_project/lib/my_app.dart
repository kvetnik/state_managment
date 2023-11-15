import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
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
          home: Provider(
            create: (context) => GetIt.I.get<ProductsBloc>(),
            child: const Home(),
          ),
      );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();
    bloc.dispatch(ProductsInitializeEvent());

    return StreamBuilder<ProductsState>(
      initialData: bloc.state,
      stream: bloc.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SimpleStateApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<CartScreen>(
                          builder: (_) => Provider.value(
                            value: Provider.of<ProductsBloc>(context),
                            child: const CartScreen(),
                          )
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart)
              ),
              Center(
                child: Padding(child: Text(snapshot.requireData.cart.length.toString()),padding: const EdgeInsets.only(right: 10),),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: snapshot.requireData.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.requireData.products.elementAt(index).name),
                trailing: snapshot.requireData.cart.contains(snapshot.requireData.products.elementAt(index))
                    ? IconButton(
                  onPressed: () {
                    bloc.dispatch(RemoveFromCartEvent(product: snapshot.requireData.products.elementAt(index)));
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green,),
                )
                    : IconButton(
                  onPressed: () {
                    bloc.dispatch(AddToCartEvent(product: snapshot.requireData.products.elementAt(index)));
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



