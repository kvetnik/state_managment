import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget{

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          final bloc = context.read<ProductsBloc>();

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
                        bloc.add(RemoveFromCartEvent(product: state.cart.elementAt(index)));
                      },
                      icon: const Icon(Icons.highlight_remove_rounded, color: Colors.red,),
                    )
                );
              },
            ),
          );
        }
    );
  }

}