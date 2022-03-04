import 'package:business/business.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{

  const CartScreen({Key? key}) : super(key: key);

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
            title: const Text('Cart'),
          ),
          body: ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.cart.elementAt(index).name),
                trailing: IconButton(
                  onPressed: () {
                    state.cart.remove(state.cart.elementAt(index));
                    state.notifyListeners();
                  },
                  icon: const Icon(Icons.highlight_remove_rounded, color: Colors.red,),
                )
              );
            },
          ),
        );
      }
    });
  }

}