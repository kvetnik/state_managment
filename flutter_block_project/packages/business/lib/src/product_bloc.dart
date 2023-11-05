import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';

class ProductsState {
  final List<ProductData> products;
  final List<ProductData> cart;

//<editor-fold desc="Data Methods">
  const ProductsState({
    required this.products,
    required this.cart,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ProductsState &&
              runtimeType == other.runtimeType &&
              products == other.products &&
              cart == other.cart);

  @override
  int get hashCode => products.hashCode ^ cart.hashCode;

  @override
  String toString() {
    return 'ProductsState{' + ' products: $products,' + ' cart: $cart,' + '}';
  }

  ProductsState copyWith({
    List<ProductData>? products,
    List<ProductData>? cart,
  }) {
    return ProductsState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
    );
  }

//</editor-fold>
}

abstract class ProductsEvents {}

class AddToCartEvent implements ProductsEvents {
  ProductData product;

  AddToCartEvent({
    required this.product,
  });
}

class RemoveFromCartEvent implements ProductsEvents {
  ProductData product;

  RemoveFromCartEvent({
    required this.product,
  });
}

class ProductsInitializeEvent implements ProductsEvents {}

@injectable
class ProductsBloc extends Bloc<ProductsEvents, ProductsState> {
  final ProductsService _productsService;


  ProductsBloc(this._productsService) : super(ProductsState(
      products: List<ProductData>.empty(growable: true),
      cart: List<ProductData>.empty(growable: true))) {
    on<ProductsInitializeEvent>((event, emit) async {
      print('Init');
      final products = await _productsService.getProducts();
      print(products.length);
      final cart = await _productsService.getCart();
      print(cart.length);
      emit(ProductsState(products: products, cart: cart));
    });
    on<AddToCartEvent>((event, emit) async {
      print("Adding: " + event.product.name);
      final products = await _productsService.getProducts();
      var cart = state.cart;
      cart = List.of(cart);
      cart.add(event.product);
      _productsService.addProductToCart(event.product);
      print(cart.length);
      emit(ProductsState(products: products, cart: cart));
    });
    on<RemoveFromCartEvent>((event, emit) async {
      print("Removing: " + event.product.name);
      final products = await _productsService.getProducts();
      var cart = state.cart;
      cart = List.of(cart);
      cart.remove(event.product);
      _productsService.removeProductFromCart(event.product);
      print(cart.length);
      emit(ProductsState(products: products, cart: cart));
    });
    add(ProductsInitializeEvent());
  }
}
