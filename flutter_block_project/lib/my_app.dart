import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
          home: BlocProvider<ProductsBloc>(
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
    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          final bloc = context.read<ProductsBloc>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('SimpleStateApp'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<CartScreen>(
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<ProductsBloc>(context),
                              child: const CartScreen(),
                            )
                        ),
                      );
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
                      bloc.add(RemoveFromCartEvent(product: state.products.elementAt(index)));
                    },
                    icon: const Icon(Icons.add_circle_outline, color: Colors.green,),
                  )
                      : IconButton(
                    onPressed: () {
                      bloc.add(AddToCartEvent(product: state.products.elementAt(index)));
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                );
              },
            ),
          );
        }
    );
  }
}