import 'dart:core';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';
import 'package:redux/redux.dart';

@injectable
@immutable
class AppState{
  final List<ProductData> products;
  final List<ProductData> cart;

  const AppState({
    required this.products,
    required this.cart,
  });

  factory AppState.initial() => const AppState(products: [], cart: []);

  AppState copyWith({
    List<ProductData>? products,
    List<ProductData>? cart,
  }) {
    return AppState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState && runtimeType == other.runtimeType &&
              products == other.products && cart == other.cart;

  @override
  int get hashCode => products.hashCode ^ cart.hashCode;

  @override
  String toString() {
    return 'AppState{products: $products, cart: $cart}';
  }
}

class InitializeEvent {}

class AddToCartEvent {
  final ProductData item;

  AddToCartEvent(this.item);
}

class RemoveFromCartEvent {
  final ProductData item;

  RemoveFromCartEvent(this.item);
}

AppState reducer(AppState state, dynamic action) => AppState(products: _productsReducer(state.products, action), cart: _cartReducer(state.cart, action));

Reducer<List<ProductData>> _productsReducer = combineReducers([
  TypedReducer<List<ProductData>, InitializeEvent>(_initializeReducer),
]);

Reducer<List<ProductData>> _cartReducer = combineReducers([
  TypedReducer<List<ProductData>, AddToCartEvent>(_addToCartReducer),
  TypedReducer<List<ProductData>, RemoveFromCartEvent>(_removeFromCartReducer),
]);

List<ProductData> _initializeReducer(List<ProductData> products, InitializeEvent action) => [const ProductData(id: 0, name: 'potato'), const ProductData(id: 1, name: 'carrot')];

List<ProductData> _addToCartReducer(List<ProductData> cart, AddToCartEvent action) {
  cart = List.of(cart);
  cart.add(action.item);
  return cart;
}

List<ProductData> _removeFromCartReducer(List<ProductData> cart, RemoveFromCartEvent action) {
  cart = List.of(cart);
  cart.remove(action.item);
  return cart;
}