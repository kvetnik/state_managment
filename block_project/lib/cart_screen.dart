import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget{

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsBloc>();

    return StreamBuilder<ProductsState>(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cart'),
            ),
            body: ListView.builder(
              itemCount: snapshot.requireData.cart.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(snapshot.requireData.cart.elementAt(index).name),
                    trailing: IconButton(
                      onPressed: () {
                        bloc.dispatch(RemoveFromCartEvent(product: snapshot.requireData.cart.elementAt(index)));
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


// class CartScreen extends StatelessWidget{
//
//   const CartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<ProductsBloc>();
//
//     return StreamBuilder<ProductsState>(
//         stream: bloc.state,
//         builder: (context, snapshot) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Cart'),
//             ),
//             body: ListView.builder(
//               itemCount: snapshot.requireData.cart.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                     title: Text(snapshot.data!.cart.elementAt(index).name),
//                     trailing: IconButton(
//                       onPressed: () {
//                         bloc.event.add(RemoveFromCartEvent(product: snapshot.data!.cart.elementAt(index)));
//                       },
//                       icon: const Icon(Icons.highlight_remove_rounded, color: Colors.red,),
//                     )
//                 );
//               },
//             ),
//           );
//         }
//     );
//   }
// }