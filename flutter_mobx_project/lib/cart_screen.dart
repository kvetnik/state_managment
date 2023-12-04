import 'package:business/business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget{

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: state.cart.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(state.cart.elementAt(index).name),
                trailing: IconButton(
                  onPressed: () {
                    state.removeProduct(state.products.elementAt(index));
                  },
                  icon: const Icon(Icons.highlight_remove_rounded, color: Colors.red,),
                )
            );
          },
        ),
      ),
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