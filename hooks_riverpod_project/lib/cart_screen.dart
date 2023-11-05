import 'package:business/business.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget{

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
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
          title: const Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(cart.elementAt(index).name),
                trailing: IconButton(
                  onPressed: () {
                    cart.remove(cart.elementAt(index));
                  },
                  icon: const Icon(Icons.highlight_remove_rounded, color: Colors.red,),
                )
            );
          },
        ),
      );
    }
  }


}