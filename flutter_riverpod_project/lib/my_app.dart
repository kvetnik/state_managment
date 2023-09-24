import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_screen.dart';

class ProductsProviderApp extends StatelessWidget{
  const ProductsProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final cart = ref.watch(cartProvider.notifier);
    final isLoaded = ref.watch(productsProvider).isNotEmpty;

    if (!isLoaded) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart)),
            Center(
              child: Padding(
                child: Text(cart.state.length.toString()),
                padding: const EdgeInsets.only(right: 10),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(products.elementAt(index).name),
              trailing: cart.state.contains(products.elementAt(index))
              // cart.contains(products.elementAt(index))
                  ? IconButton(
                      onPressed: () {
                        // cart.remove(products.elementAt(index));
                        cart.deleteProduct(products.elementAt(index));
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        cart.addProduct(products.elementAt(index));
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
            );
          },
        ),
      );
    }
  }
}