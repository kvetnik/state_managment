import 'dart:async';

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
class ProductsBloc{
  final ProductsService _productsService;

  var _state = ProductsState(
    products: List.empty(growable: true),
    cart: List.empty(growable: true),
  );

  final _eventController = StreamController<ProductsEvents>.broadcast();
  late final Stream<ProductsState> _stateStream;

  ProductsState get state => _state;
  Stream<ProductsState> get stream => _stateStream;

  ProductsBloc(this._productsService) {
    _stateStream = _eventController.stream
        .asyncExpand<ProductsState>(_mapEventToState)
        .asyncExpand(_updateState)
        .asBroadcastStream();
  }

  void dispatch(ProductsEvents event) {
    _eventController.add(event);
  }

  Stream<ProductsState> _updateState(ProductsState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  Stream<ProductsState> _mapEventToState(ProductsEvents event) async* {
    if (event is ProductsInitializeEvent) {
      final products = await _productsService.getProducts();
      final cart = await _productsService.getCart();
      yield ProductsState(products: products, cart: cart);
    } else if (event is AddToCartEvent) {
      final products = await _productsService.getProducts();
      var cart = _state.cart;
      cart = List.of(cart);
      cart.add(event.product);
      _productsService.addProductToCart(event.product);
      yield ProductsState(products: products, cart: cart);
    } else if (event is RemoveFromCartEvent) {
      final products = await _productsService.getProducts();
      var cart = _state.cart;
      cart = List.of(cart);
      cart.remove(event.product);
      _productsService.removeProductFromCart(event.product);
      yield ProductsState(products: products, cart: cart);
    }
  }

}