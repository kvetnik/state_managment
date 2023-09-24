import 'package:data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:model/model.dart';

@injectable
class ProductsNotifier extends StateNotifier<List<ProductData>> {
  ProductsNotifier(this._productService) : super([]){
    _initProducts();
  }
  late final ProductsService _productService;

  // ignore: avoid_void_async
  void _initProducts() async {
    state = await _productService.getProducts();
  }
}

@injectable
class CartNotifier extends StateNotifier<List<ProductData>> {
  CartNotifier() : super([]);

  void addProduct(ProductData productData) {
    state.add(productData);
  }

  void deleteProduct(ProductData productData) {
    state.remove(productData);
  }
}