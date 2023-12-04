import 'dart:core';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:model/model.dart';

part 'state.g.dart';

@injectable
class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  ProductsService productsService;

  _AppState(this.productsService) {
    init();
  }

  @observable
  ObservableList<ProductData> products = ObservableList<ProductData>();

  @observable
  ObservableList<ProductData> cart = ObservableList<ProductData>();

  Future<void> init() async {
    products = ObservableList<ProductData>();
    var productsFromRep = await productsService.getProducts();
    for (ProductData product in productsFromRep) {
      products.add(product);
    }
  }

  @action
  Future<void> addProduct(ProductData item) async {
    cart.add(item);
  }

  @action
  Future<void> removeProduct(ProductData item) async {
    cart.remove(item);
  }

}